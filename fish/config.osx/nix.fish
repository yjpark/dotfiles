set -x NIX_REMOTE ""
set -x NIX_CURL_FLAGS "-x $http_proxy"

alias ns "nix-shell --command fish"
if test -d ~/.nix-profile
    bass source ~/.nix-profile/etc/profile.d/nix.sh
end
