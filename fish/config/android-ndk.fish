if test -d ~/Applications/android-ndk
    set -x ANDROID_NDK_HOME ~/Applications/android-ndk/
end

if test -d ~/Applications/android-ndk/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86_64/bin/
    set -x PATH $PATH ~/Applications/android-ndk/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86_64/bin/
end
