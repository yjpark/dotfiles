function use-oracle-jdk-8
    if test -d /Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/bin
        set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"
        set -x PATH "/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/bin" $PATH
    end
end

function use-oracle-jdk-11
    if test -d /Library/Java/JavaVirtualMachines/jdk11.0.3.jdk/Contents/Home/bin
        set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk11.0.3.jdk/Contents/Home"
        set -x PATH "/Library/Java/JavaVirtualMachines/jdk11.0.3.jdk/Contents/Home/bin" $PATH
    end
end

use-oracle-jdk-8
