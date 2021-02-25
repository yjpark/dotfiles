if test -d /usr/local/share/dotnet
    alias dotnet /usr/local/share/dotnet/dotnet
end

if test -d ~/.dotnet/tools
    set -x PATH $PATH ~/.dotnet/tools
end
