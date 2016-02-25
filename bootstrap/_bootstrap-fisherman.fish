#
#    The easiest and fastest way to get up and running with Fisherman.
#
#        curl -sL get.fisherman.com | fish
#
#    If you prefer, you can download the script and run it yourself or
#    follow the manual install procedure described in the README file.
#
#    Alternatively, you can export the variable TRY_ME and the installer
#    will show you how it works without installing Fisherman.
#
#        curl -sL get.fisherman.sh | env TRY_ME=true fish
#

function __fisher_format_source_safe
    if not command fish_indent $argv ^ /dev/null
        command fish_indent
    end
end

function __fisher_home_humanize
    set -l tilde "$fisher_color_match~$fisher_color_close"
    sed "s|$HOME|$tilde|"
end

function __fisher_run_commands -a message commands
    set -l fish_debug_copy $fish_debug
    set fish_debug

    # Run commands in the background and display a message next to a progress spinner.
    # This function is an abridged version of Spin https://github.com/fishery/spin

    set -l tmp (mktemp -t fisherman.XXX)

    if test "$TRY_ME" = true
        printf "%s\n" $commands | __fisher_format_source_safe --ansi
        return
    else
        printf "%s\n" $commands | __fisher_format_source_safe | fish > /dev/null ^ $tmp &
    end

    while true
        for spinner in ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏
            set -l message (printf "%s\n" $message | __fisher_home_humanize)
            printf " $fisher_color_match$spinner$fisher_color_close $message\r"
            sleep 0.02
        end

        if test -z (jobs)
            break
        end
    end

    if test -s $tmp
        printf "\r $fisher_error_symbol\n\n"

        printf "Sorry, but I couldn't install Fisherman. Some things you can try:\n\n"

        printf "%s\n" " $fisher_arrow_symbol Upgrade your Git version (^2.0)"
        printf "%s\n" " $fisher_arrow_symbol Upgrade your Fish version (^2.2.0)"
        printf "%s\n" " $fisher_arrow_symbol Make sure you can write to $fisher_home"
        printf "%s\n" " $fisher_arrow_symbol Make sure you are connected to the Internet"
        printf "%s\n"
        printf "%s\n" "For more help visit "$fisher_color_uline"http://issues.fisherman.sh$fisher_color_close"

        command rm -f $tmp

        set fish_debug $fish_debug_copy

        exit 1
    end

    set fish_debug $fish_debug_copy

    command rm -f $tmp

    printf "\r $fisher_check_symbol \n"
end

function __fisher_install_fisherman
    set xdg_home ~/.local/share
    set xdg_config ~/.config

    if test ! -z "$XDG_DATA_HOME"
        set xdg_home $XDG_DATA_HOME
    end

    if test ! -z "$XDG_CONFIG_HOME"
        set xdg_config $XDG_CONFIG_HOME
    end

    set fisher_home "$xdg_home/fisherman"
    set fish_config "$xdg_config/fish"

    set -l config $fish_config/config.fish

    if test -d $fisher_home
        printf " $fisher_error_symbol %s\n\n" "Fisherman is already installed. To install it again:"

        printf " $fisher_arrow_symbol %s\n" "Remove $fisher_home" \
            | __fisher_home_humanize

        if test -s $config
            printf " $fisher_arrow_symbol %s\n" "Remove the following configuration from $fish_config" \
                | __fisher_home_humanize

            printf "%s\n"
            set -l indent (set_color 555)░(set_color normal)
            grep "fisher" $config | __fisher_format_source_safe --ansi | sed "s/^/ $indent /"

            set_color normal
        end

        printf "\n%s\n" "For more help visit "$fisher_color_uline"http://issues.fisherman.sh$fisher_color_close"

        exit 1
    end

    if test "$version" = 2.1.2
        printf "%s\n" (set_color ff0
            )" • Please upgrade to fish 2.2.0 for better results.$fisher_color_close"
    end

    __fisher_run_commands \
        "Downloading Fisherman to $fisher_home" \
        "   # Clone Fisherman repository to XDG_DATA_HOME/fisherman
            git clone --quiet --depth 1 $fisher_remote_uri $fisher_home
        "

    __fisher_run_commands \
        "Creating the configuration in $xdg_config/fisherman" \
        "   # Create Fisherman configuration directories in XDG_CONFIG_HOME/fisherman
            pushd '$fisher_home'

            if test (uname) = 'FreeBSD'
                gmake > /dev/null
            else
                make > /dev/null
            end

            popd
        "

    __fisher_run_commands \
        "Updating the registry index" \
        "   # Download Fisherman index file without a timeout
            __fisher_index_update 0
        "

    __fisher_run_commands \
        "Installing CLI utilities" \
        "   # Install CLI utilities. See github.com/fishery/{spin,debug}
            fisher_install 'spin' 'debug' --quiet
        "

    if test "$TRY_ME" = true
        printf "%s\n" \
            "# Reload your shell session to make Fisherman immediately available
            exec fish < /dev/tty" | __fisher_format_source_safe --ansi
        exit
    end

    printf " $fisher_check_symbol Done!$fisher_color_close\n\n"
    printf "Enter$fisher_color_match fisher$fisher_color_close to begin or visit one of the links below:\n\n"

    printf " $fisher_arrow_symbol Quickstart Guide "$fisher_color_uline"http://start.fisherman.sh$fisher_color_close\n"
    printf " $fisher_arrow_symbol Slack Community  "$fisher_color_uline"http://slack.fisherman.sh$fisher_color_close\n"
    printf " $fisher_arrow_symbol Plugins Market   "$fisher_color_uline"http://plugins.fisherman.sh$fisher_color_close\n"

    if set -q CI
        exit
    end

    exec fish < /dev/tty
end

set -g fisher_color_match (set_color $fish_color_match)
set -g fisher_color_uline (set_color -u)
set -g fisher_color_error (set_color $fish_color_error)
set -g fisher_color_close (set_color $fish_color_normal)

set -g fisher_check_symbol $fisher_color_match"✓"$fisher_color_close
set -g fisher_error_symbol $fisher_color_error"×"$fisher_color_close
set -g fisher_arrow_symbol $fisher_color_match"→"$fisher_color_close

set -g fisher_remote_uri "https://github.com/fisherman/fisherman"

__fisher_install_fisherman
