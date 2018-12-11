# abbreviations
aliases['d'] = 'docker'
aliases['g'] = 'git'
aliases['a'] = 'ag --smart-case --ignore-dir bin --ignore-dir obj'

# just aliases
aliases['l'] = 'ls -l'
aliases['cb'] = 'clear_buffer'

aliases['ll'] = 'ls -lh'
aliases['la'] = 'ls -A'
aliases['lal'] = 'ls -lhA'
aliases['ldl'] = 'll -p | grep /'
aliases['less'] = 'less -R'
aliases['df'] = 'df -h'
aliases['mbp'] = 'sudo hostname mbp; . ~/bin/mbp/yjpark.fish'
aliases['air'] = 'sudo hostname air; . ~/bin/air/yjpark.fish'
aliases['win'] = '. ~/bin/win/fish.yjpark'
aliases['iftop'] = 'sudo iftop -B -P'

aliases['set-proxy-off'] = 'set -ge https_proxy; set -ge http_proxy; set -ge ALL_PROXY'
aliases['set-proxy-ss'] = 'set -gx https_proxy 127.0.0.1:1102; set -gx http_proxy 127.0.0.1:1102; set -gx ALL_PROXY http://127.0.0.1:1102'
aliases['set-proxy-v2ray'] = 'set -gx https_proxy 127.0.0.1:1104; set -gx http_proxy 127.0.0.1:1104; set -gx ALL_PROXY http://127.0.0.1:1104'
aliases['set-proxy-cow'] = 'set -gx https_proxy 127.0.0.1:1100; set -gx http_proxy 127.0.0.1:1100; set -gx ALL_PROXY http://127.0.0.1:1100'
aliases['set-proxy-fiddler'] = 'set -gx https_proxy 127.0.0.1:8888; set -gx http_proxy 127.0.0.1:8888; set -gx ALL_PROXY http://127.0.0.1:8888'

aliases['wget'] = 'wget --no-check-certificate'

aliases['ssh'] = 'ssh -A'
aliases['scp'] = 'scp -C -p'

aliases['mosh'] = "mosh --ssh='ssh -A'"

# some custom alias
aliases['e'] = 'nvim'

aliases['cp'] = 'cp -v'
aliases['mv'] = 'mv -v'

aliases['nload'] = 'nload -u K'

aliases['lu'] = 'du -s -h'
aliases['zhcon'] = 'zhcon --utf8 --drv=vga'

aliases['root'] = 'sudo chown root:root -R'

aliases['axel'] = 'axel -a'

aliases['htop'] = 'htop --sort-key PERCENT_CPU'

aliases['vimx'] = 'vim -u ~/.vimrcx -x'
aliases['fresh-fish'] = '. ~/.config/fish/config.fish'

aliases['gwp'] = 'git-commit-wip-push'

