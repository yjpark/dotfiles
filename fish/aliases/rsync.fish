# Follow this page 
# https://gist.github.com/KartikTalwar/4393116
# "ssh -T -c arcfour -o Compression=no -x" the arcfour Cipher need server side config, so not included

alias rsync.progress 'rsync -aHAXxv --numeric-ids --stats --progress -e "ssh -T -o Compression=no -x"'
alias rsync.progress.compress 'rsync -aHAXxv --numeric-ids --stats --progress  -e "ssh -T -o Compression=no -x" --compress'
alias rsync.progress.delete 'rsync -aHAXxv --numeric-ids --stats --progress  -e "ssh -T -o Compression=no -x" --delete'
