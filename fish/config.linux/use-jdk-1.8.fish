function use-jdk-1.8
    if test -d /usr/lib/jvm/java-1.8.0-openjdk-amd64/bin
        set -x JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk-amd64"
        set -x PATH "/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin" $PATH
    end
end
