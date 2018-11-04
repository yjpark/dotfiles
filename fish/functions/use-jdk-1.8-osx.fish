function use-jdk-1.8-osx
    if test -d /Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/bin
        set -x PATH "/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/bin" $PATH
        set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"
    end
end
