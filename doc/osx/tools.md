## quick look plugins
https://github.com/sindresorhus/quick-look-plugins

Install through brew cask
```
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
```

Run this to allow text selection in the quickview window
```
defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder
```
