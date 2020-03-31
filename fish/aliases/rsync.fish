alias rsync.progress 'rsync -aHAXxv --numeric-ids --stats --progress -e "ssh -T -c arcfour -o Compression=no -x"'
alias rsync.progress.compress 'rsync -aHAXxv --numeric-ids --stats --progress  -e "ssh -T -c arcfour -o Compression=no -x" --compress'
alias rsync.progress.delete 'rsync -aHAXxv --numeric-ids --stats --progress  -e "ssh -T -c arcfour -o Compression=no -x" --delete'
