# (N)ode (V)ersion manager for the (F)ish shell
# =============================================
#
# This script started as a simple conversion to fish of nave,
# written by Isaac Z. Schlueter (https://github.com/isaacs/nave)
#
# Some ideas and/or code have been taken from nvm, written by
# Tim Caswell (https://github.com/creationix/nvm)
#
# Some ideas might have been taken from rvm, rbenv and others.
#
# All the bugs are my own.
#
# This software is released in the public domain, just give credits
# where credits are due.
#
# INSTALLATION
# ============
#
# Place this script inside ~/.config/fish/functions and
# add this line to your ~/.config/fish/config.fish
#
# if test -d ~/.nvf; nvf init; end

function nvf
    set -l NVF_DIR  $HOME/.nvf
    set -l NVF_SRC  $NVF_DIR/sources
    set -l NVF_ROOT $NVF_DIR/installed

    function __ensure_dir
        if test -d $argv[1]
            return 0
        end
        mkdir -p $argv[1]
    end

    function __get
        curl -H "'user-agent:nvf-"(curl --version | head -n1)"'" $argv
    end

    function __version
        # translates the version supplied on the command line into an
        # actual version (e.g. 'stable' or just '0.10' to select
        # the lastest version in the 0.10.xx releases
        set -l _version (echo $argv[1] | sed 's/^v//')
        switch $_version
            case latest
                __nvf_latest
            case stable
                __nvf_stable
            case '?*.?*.?*'
                echo $_version
            case '?*.?*'
                __version_family $_version
            case '*'
                exit 1
        end
    end

    function __get_versions
        __get -s http://nodejs.org/dist/
    end

    function __sort_versions
        # extracts node versions according to patterns and sorts them
        set -l pattern

        if set -q $argv
            set pattern '[0-9]+\.[0-9]+\.[0-9]+'
        else
            set pattern $argv[1]
        end
        egrep -o $pattern | sort -u -k 1,1n -k 2,2n -k 3,3n -t .
    end

    function __version_family
        set -l family $argv[1]
        __get_versions \
            | __sort_versions $family'\.[0-9]+' \
            | tail -n1
    end

    function __print_versions --no-scope-shadowing
        set -l padded_version
        set -l counter 0

        while read -l _version
            if test -d $NVF_ROOT/$_version
                set padded_version (printf '%s%-10s%s' \
                    (set_color $fish_color_command) \
                    $_version \
                    (set_color $fish_color_normal))
            else
                set padded_version (printf '%-10s' $_version)
            end

            if test $counter -ne 6
                set counter (math $counter+1)
                echo -ne $padded_version' '
            else
                echo -e $padded_version
                set counter 0
            end
        end

        echo ''
        if test $counter -ne 0
            echo ''
        end
    end

    function __is_installed --no-scope-shadowing
        # tests if a specific version of node is installed
        test -x $NVF_ROOT/$argv[1]/bin/node
    end

    function __verify_checksum --no-scope-shadowing
        set -l remote $argv[1]
        set -l url (dirname $remote)
        set -l archive (basename $remote)

        set -l rsum (curl -s $url/SHASUMS.txt | grep $archive | awk '{print $1}')
        if test -z $rsum
            echo Checksum not found for $archive
            return 1
        else
            set -l lsum (shasum $NVF_SRC/$archive | awk '{print $1}')
            if test $rsum != $lsum
                echo Checksums do not match
                return 1
            end
        end
        return 0
    end

    function __get_file --no-scope-shadowing
        set -l remote $argv[1]
        set -l archive (basename $remote)

        echo Downloading $remote
        if test -f $NVF_SRC/$archive
            return 0
        end
        __get -L -f --progress-bar $remote -o $NVF_SRC/$archive
    end

    function __compile_sources --no-scope-shadowing
        set -l destination $argv[2]
        set -l sources $argv[1]
        set -l result 0
        set -l jobs

        if test -f ~/.nvfrc
            source ~/.nvfrc
        end

        if test -z $JOBS
            set jobs (sysctl -n hw.ncpu)
        else
            set jobs $JOBS
        end
        if test -z $jobs
            set jobs 2
        end

        echo Compiling sources in $sources

        pushd $sources
        and ./configure --prefix=$destination $NVF_CONFIG
        and make -j$jobs
        and make install
        or set result 1
        popd

        return $result
    end

    function __install_source --no-scope-shadowing
        set -l destination $argv[2]
        set -l _version $argv[1]
        set -l archive
        set -l remote

        # get the file and unpack it into ~/.nvf/sources/X where X
        # is the name of the file without the extension. let's try
        # not to download it again if we already have it

        set remote "http://nodejs.org/dist/v$_version/node-v$_version.tar.gz"
        # older versions without checksum
        set -l urls \
            "http://nodejs.org/dist/node-v$_version.tar.gz" \
            "http://nodejs.org/dist/node-$_version.tar.gz"

        __get_file $remote
        and __verify_checksum $remote
        and set archive (basename $remote)
        or begin
            for remote in $urls
                __get_file $remote
                and set archive (basename $remote)
                and break
            end
        end

        if test -z $archive
            echo Cannot download sources for version $_version
            return 1
        end

        set -l sources $NVF_SRC/(basename $archive .tar.gz)
        set -l local $NVF_SRC/$archive

        rm -rf $sources
        __ensure_dir $sources

        tar xzf $local -C $sources --strip-components=1
        and __compile_sources $sources $destination
        or begin
            echo Failed to install $_version from sources
            rm -rf $sources
            rm -f $local
            return 1
        end
    end

    function __install_binary --no-scope-shadowing
        set -l destination $argv[2]
        set -l _version $argv[1]
        set -l arch
        set -l os

        # binaries started with node 0.8.6
        switch $_version
            case '0.0.?*' '0.1.?*' '0.2.?*' '0.3.?*' '0.4.?*' '0.5.?*' '0.6.?*' '0.7.?*'
                return 1
            case '0.8.0' '0.8.1' '0.8.2' '0.8.3' '0.8.4' '0.8.5'
                return 1
        end

        switch (uname -s)
            case Darwin
                set os darwin
            case Linux
                set os linux
            case '*'
                return 1
        end
        switch (uname -m)
            case x86_64
                set arch x64
            case '*'
                set arch x86
        end

        set -l archive "node-v$_version-$os-$arch.tar.gz"
        set -l remote "http://nodejs.org/dist/v$_version/$archive"
        set -l local $NVF_SRC/$archive

        # get the file and directly unpack it into ~/.nvf/installed/
        __get_file $remote
        and __verify_checksum $remote
        and tar xzf $local -C $destination --strip-components=1
        or begin
            echo Binary installation failed, trying source.
            rm -f $local
            return 1
        end
    end

    function __clear_env --no-scope-shadowing
        which node > /dev/null
        or return

        set -l node_version (node --version | sed 's/^v//')
        set -l man $NVF_ROOT/$node_version/share/man
        set -l bin $NVF_ROOT/$node_version/bin

        if contains $man $MANPATH
            set -l index (contains -i $man $MANPATH)
            set -e MANPATH[$index]
        end
        if contains $bin $PATH
            set -l index (contains -i $bin $PATH)
            set -e PATH[$index]
        end
    end

    function __setup_env
        set -l man $argv[1]/share/man
        set -l bin $argv[1]/bin

        # $MANPATH is copied from nvm, but it seems
        # it's ignored on OSX (at least on 10.9)
        if not contains $man $MANPATH
            set -g MANPATH $man $MANPATH
        end
        if not contains $bin $PATH
            set PATH $bin $PATH
        end
    end

    function __nvf_local --no-scope-shadowing
        set -l quiet 0

        switch $argv[1]
            case -q --quiet
                set -e argv[1]
                set quiet 1
        end

        if test $argv[1] = 'system'
            echo Using system node
            __clear_env
            return
        end

        set -l _version (__version $argv[1])
        set -l bin $NVF_ROOT/$_version/bin

        if contains $bin $PATH
            if test $quiet -eq 0
                echo Already using $_version
            end
            return
        end

        which node > /dev/null
        and begin
            set -l node_version (node --version)
            if test v$_version = $node_version
                if test $quiet -eq 0
                    echo Already using $_version
                end
                return
            end
        end

        if not __is_installed $_version
            if test $quiet -eq 0
                echo Node version $_version is not installed
            end
            return 1
        end

        __clear_env
        __setup_env $NVF_ROOT/$_version
        if test $quiet -eq 0
            echo Using node version $_version
        end
    end

    function __nvf_global --no-scope-shadowing
        if test $argv[1] = 'system'
            echo Using system node
            rm $NVF_DIR/default
            __clear_env
            return
        end

        __nvf_local $argv
        # save the selected version
        set -l _version (__version $argv[1])
        and echo $_version > $NVF_DIR/default
    end

    function __nvf_clean --no-scope-shadowing
        if set -q $argv
            rm -rf $NVF_SRC/*
        else
            set -l _version (__version $argv[1])
            set -l target $NVF_SRC/node-?$_version*

            rm -rf $target
        end
    end

    function __nvf_install --no-scope-shadowing
        set -l _version (__version $argv[1])
        set -l destination $NVF_ROOT/$_version

        if __is_installed $_version
            echo Version $_version already installed
        else
            __ensure_dir $destination
            and begin
                __install_binary $_version $destination
                or __install_source $_version $destination
                and echo Version $_version succesfully installed
                or rm -rf $destination
            end
            or echo Cannot create $destination
        end
    end

    function __nvf_uninstall --no-scope-shadowing
        set -l _version (__version $argv[1])

        if not __is_installed $_version
            echo Version $_version is not installed
            return 1
        end

        which node > /dev/null
        and begin
            set -l dir (dirname (which node))

            # if we are using a "local" version, switch to the "global"
            # version. if we are using a "global" version, switch
            # to the system version and erase ~/.nvf/default
            # if we are using a system node, do nothing
            if contains $dir $PATH
                set -l global (cat $NVF_DIR/default)

                if test $_version != $global
                    __nvf_local $global
                else
                    __nvf_global system
                end
            end
        end

        rm -rf $NVF_ROOT/$_version
        echo Uninstalled version $_version
    end

    function __nvf_latest --no-scope-shadowing
        __get_versions \
            | __sort_versions '[0-9]+\.[0-9]+\.[0-9]+' \
            | tail -n1
    end

    function __nvf_stable --no-scope-shadowing
        __get_versions \
            | __sort_versions '[0-9]+\.[0-9]*[02468]\.[0-9]+' \
            | tail -n1
    end

    function __nvf_ls --no-scope-shadowing
        echo installed:
        ls $NVF_ROOT | __sort_versions | __print_versions
        return 0
    end

    function __nvf_ls_remote --no-scope-shadowing
        echo remote:
        __get_versions | __sort_versions | __print_versions
    end

    function __nvf_help
        echo "
Usage: nvf <command>

Commands:

install <version>    Install the version specified (e.g. 0.10.22)
global <version>     use <version> for the current and future sessions
local <version>      use <version> for the current session only
clean <version>      Delete the source code for <version>
uninstall <version>  Delete <version>
ls                   List versions currently installed
ls-remote            List remote node versions
ls-all               List remote and local node versions
latest               Show the most recent dist version
stable               Show the most recent stable version
help                 Output help information

<version> can be:
    'stable' to get the latest stable version.
    'latest' to get the latest distribution.
    'system' to use the system-wide node.

'system' is only available to the 'local' and 'global' commands.

to uninstall nvf just delete ~/.nvf and ~/.config/fish/functions/nvf.fish
"
    end

    if set -q $argv
        __nvf_help
        return
    end

    __ensure_dir $NVF_ROOT
    __ensure_dir $NVF_SRC

    set -l command $argv[1]
    set -e argv[1]

    switch $command
        case init
            if test -f $NVF_DIR/default
                __nvf_local --quiet (cat $NVF_DIR/default)
            end
        case ls-all
            __nvf_ls_remote
            __nvf_ls
        case ls-remote
            __nvf_ls_remote
        case ls
            __nvf_ls
        case latest
            __nvf_latest
        case stable
            __nvf_stable
        case local
            __nvf_local $argv
        case global
            __nvf_global $argv
        case uninstall
            __nvf_uninstall $argv
        case install
            __nvf_install $argv
        case clean
            __nvf_clean $argv
        case '*'
            __nvf_help
    end
end
