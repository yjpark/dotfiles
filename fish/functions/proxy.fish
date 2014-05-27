function set-proxy-on
    set -x http_proxy 127.0.0.1:8118
end

function set-proxy-off
    set -e http_proxy
end

