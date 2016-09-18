set -x NIX_REMOTE ""
set -x NIX_CURL_FLAGS "-x $http_proxy"

alias ns "nix-shell --command fish"
bass source ~/.nix-profile/etc/profile.d/nix.sh

