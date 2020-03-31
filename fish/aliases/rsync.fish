alias rsync 'rsync -aHAXxv --numeric-ids --stats --progress -e "ssh -T -c arcfour -o Compression=no -x"'
alias rsync.compress 'rsync -aHAXxv --numeric-ids --stats --progress  -e "ssh -T -c arcfour -o Compression=no -x" --compress'
alias rsync.delete 'rsync -aHAXxv --numeric-ids --stats --progress  -e "ssh -T -c arcfour -o Compression=no -x" --delete'
