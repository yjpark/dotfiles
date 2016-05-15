#!env fish

functions -e a
function a
    ag --smart-case --search-files $argv | grep $argv[1] -
end
