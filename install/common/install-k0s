#!/bin/sh

set -e

if [ -n "${DEBUG}" ]; then
  set -x
fi

_k0s_latest() {
  curl -sSLf "https://docs.k0sproject.io/stable.txt"
}

_detect_binary() {
  os="$(uname)"
  case "$os" in
    Linux) echo "k0s" ;;
    *) echo "Unsupported operating system: $os" 1>&2; return 1 ;;
  esac
  unset os
}

_detect_arch() {
  arch="$(uname -m)"
  case "$arch" in
    amd64|x86_64) echo "amd64" ;;
    arm64|aarch64) echo "arm64" ;;
    armv7l|armv8l|arm) echo "arm" ;;
    *) echo "Unsupported processor architecture: $arch" 1>&2; return 1 ;;
  esac
  unset arch
}

_download_url() {
  echo "https://github.com/k0sproject/k0s/releases/download/$K0S_VERSION/$k0sBinary-$K0S_VERSION-$k0sArch"
}

main() {
  if [ -z "${K0S_VERSION}" ]; then
    K0S_VERSION=$(_k0s_latest)
  fi

  k0sInstallPath=/usr/local/bin
  k0sBinary="$(_detect_binary)"
  k0sArch="$(_detect_arch)"
  k0sDownloadUrl="$(_download_url)"

  mkdir -p -- "$k0sInstallPath"

  echo "Downloading k0s from URL: $k0sDownloadUrl"

  curl -sSLf "$k0sDownloadUrl" >"$k0sInstallPath/$k0sBinary"
  chmod 755 -- "$k0sInstallPath/$k0sBinary"

  echo "k0s is now executable in $k0sInstallPath"
}

main
