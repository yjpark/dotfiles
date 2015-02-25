## quick look plugins
https://github.com/sindresorhus/quick-look-plugins

Install through brew cask
```
brew cask install qlstephen qlmarkdown quicklook-json qlprettypatch betterzipql suspicious-package qlimagesize webpquicklook provisionql
```

Install through brew cask (need VPN)
```
brew cask install qlcolorcode quicklook-csv
```

Run this to allow text selection in the quickview window
```
defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder
```
