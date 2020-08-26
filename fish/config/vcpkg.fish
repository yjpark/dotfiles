if test -d ~/projects/tools/vcpkg
    alias vcpkg '~/projects/tools/vcpkg/vcpkg'
    vcpkg integrate install
    vcpkg integrate fish
end
