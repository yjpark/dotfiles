#! /usr/bin/osascript


on run argv
    tell app "iTerm2"
        create window with default profile
        activate
    end
end run
