# https://github.com/apple/sourcekit-lsp

if test -e /Library/Developer/Toolchains/swift-latest.xctoolchain
    set -x SOURCEKIT_TOOLCHAIN_PATH /Library/Developer/Toolchains/swift-latest.xctoolchain
    set -x PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH
end
