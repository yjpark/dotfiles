if test -d ~/.nix-profile
    bass source ~/.nix-profile/etc/profile.d/nix.sh
    set -x PATH $PATH ~/.nix-profile/bin/
end
