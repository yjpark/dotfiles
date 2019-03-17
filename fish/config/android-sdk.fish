if test -d ~/Applications/android-sdk
    set -x ANDROID_HOME "$HOME/Applications/android-sdk/"
    set -x ANDROID_SDK "$HOME/Applications/android-sdk/"
end

if test -d ~/Applications/android-sdk/platform-tools
    set -x PATH $PATH ~/Applications/android-sdk/platform-tools
end

if test -d ~/Applications/android-sdk/emulator
    set -x PATH $PATH ~/Applications/android-sdk/emulator
end

