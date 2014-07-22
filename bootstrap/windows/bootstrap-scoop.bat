set-executionpolicy unrestricted -s cu

iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
