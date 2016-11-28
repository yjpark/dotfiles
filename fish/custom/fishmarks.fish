# based on https://github.com/gonsie/fishmarks
# changed the command name, and put multiple files into one.

function gg -d "fishmarks change to bookmark directory"
         fishmark_help $argv[1]
         fishmark_source
         if test -z $argv
            bookmark-list
         else
            set -l target (eval echo \$(echo DIR_(echo $argv[1])))
            set -l warn (set_color $fish_color_error)
            if test -d $target
               cd $target
               echo $target
            else if not test -n $target
               echo -e $warn "WARNING: $argv[1] fishmark does not exist"
            else
               echo -e $warn "WARNING: $target does not exist"
            end
         end
end

function bookmark-delete -d "fishmarks delete bookmark"
         fishmark_help $argv[1]
         fishmark_name_valid $argv
         fishmark_purge_line $SDIRS "DIR_$argv[1]"
         set -e DIR_$argv[1]
end

function fishmark_help -d "prints fishmarks help if flagged"
         # note: cannot use contains because of "-h" override
         set __help 0
         for h in $argv
             if test $h = "-h"
                set __help 1
             else if test $h = "-help"
                set __help 1
             else if test $h = "--help"
                set __help 1
             end
         end
         if test $__help -eq 1
                echo ""
                echo "s <bookmark_name> - Saves the current directory as a 'bookmark_name'"
                echo "c <bookmark_name> - Goes (cd) to the directory associated with 'bookmark_name'"
                echo "c                 - Goes to home directory (cd ~)"
                echo "p <bookmark_name> - Prints the directory associated with 'bookmark_name'"
                echo "d <bookmark_name> - Deletes the bookmark"
                echo "l                 - Lists all available bookmarks"
                kill -SIGINT %self
         end
end

function fishmark_name_valid -d "determine if argument can be a valid bookmark name"
         if not test $argv[1] = (echo $argv[1] | sed 's/[^A-Za-z0-9_]//g')
            echo "invalid bookmark name"
            kill -SIGINT %self
         end
end

function fishmark_purge_line -d "remove a line from bookmark file"
         if test -s $argv[1]
            # safely create a temp file
            set t (mktemp -t fishmarks.XXXXXX); or exit 1
# NOTE: trap is broken on OS X for right now
#            trap "rm -f -- $t" EXIT

            # purge line
            sed "/$argv[2]/d" "$argv[1]" > "$t"
            mv "$t" "$argv[1]"

            # cleanup temp file
            rm -f -- "$t"
#            trap - EXIT
         end
end

function fishmark_source -d "set up bookmark file"
         set -g SDIRS ~/.sdirs
         if not test -e $SDIRS
            touch $SDIRS
         else
            set -l __ns (cut -f1 -d' ' $SDIRS)
            set -l __ds (cut -f2 -d' ' $SDIRS)
            set -l __i (wc -l < $SDIRS)
            while test $__i -ne 0
                  set -g $__ns[$__i] $__ds[$__i]
                  set __i (math $__i - 1)
            end
         end
end

function bookmark-list -d "fishmarks list all bookmarks"
         fishmark_help $argv
         fishmark_source

         cat $SDIRS | sort | awk '/DIR_.+/{split(substr($0,5),parts," "); printf("\033[0;33m%-20s\033[0m %s\n", parts[1], parts[2]);}'
end

function bookmark-print -d "fishmarks list location of bookmark"
         fishmark_help $argv
         fishmark_source
         
         if test -z $argv
            echo $HOME
         else
            cat $SDIRS | grep "^DIR_$argv" | cut -f2 -d' '
         end
end

function bookmark-save -d "fishmarks save a bookmark to current directory with given name"
         fishmark_help $argv[1]
         fishmark_source
         fishmark_name_valid $argv
         fishmark_purge_line $SDIRS "DIR_$argv[1]"
         echo "DIR_$argv[1]" (pwd) >> $SDIRS
end

# c
complete -x -c gg -d "Saved bookmarks" -xa "(cat ~/.sdirs | cut -f1 -d' ' | cut -c5-)"

# c
complete -x -c bookmark-delete -d "Saved bookmarks" -xa "(cat ~/.sdirs | cut -f1 -d' ' | cut -c5-)"

# c
complete -x -c bookmark-print -d "Saved bookmarks" -xa "(cat ~/.sdirs | cut -f1 -d' ' | cut -c5-)"

