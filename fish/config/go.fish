if test -d ~/.go
    set -x GOPATH ~/.go
end

if test -d ~/.go/bin
    set -x PATH $PATH ~/.go/bin
end
