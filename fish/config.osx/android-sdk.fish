if test -d ~/Applications/android-sdk
    set -x ANDROID_SDK_HOME "$HOME/Applications/android-sdk/platform-tools/"
    set -x PATH $PATH ~/Applications/android-sdk/platform-tools
end
