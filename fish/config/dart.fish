if test -d ~/Applications/flutter/bin/cache/dart-sdk/bin
    set -x PATH $PATH ~/Applications/flutter/bin/cache/dart-sdk/bin
end

if test -d ~/.pub-cache/bin
    set -x PATH $PATH ~/.pub-cache/bin
end

# may need to update /etc/hosts if can't connect to pub.dartlang.org
#
# 216.58.200.51   pub.dartlang.org
