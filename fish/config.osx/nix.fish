set -x NIX_REMOTE ""
set -x NIX_CURL_FLAGS "-x $http_proxy"

alias ne 'nix-env -f "<nixpkgs>"'
alias ns 'nix-shell "<nixpkgs>" --command fish'

if test -d ~/.nix-profile
    bass source ~/.nix-profile/etc/profile.d/nix.sh
end
