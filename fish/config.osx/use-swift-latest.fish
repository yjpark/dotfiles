function use-swift-latest
    if test -e /Library/Developer/Toolchains/swift-latest.xctoolchain
        set -x PATH /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH
    end
end

