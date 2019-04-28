function use-oracle-jdk-1.11
    if test -d /usr/lib/jvm/java-11-oracle
        set -gx JAVA_HOME "/usr/lib/jvm/java-11-oracle"
        set -x PATH "/usr/lib/jvm/java-11-oracle/bin" $PATH
    end
end

function use-openjdk-1.8
    if test -d /usr/lib/jvm/java-1.8.0-openjdk-amd64/bin
        set -gx JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk-amd64"
        set -x PATH "/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin" $PATH
    end
end
