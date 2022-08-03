.PHONY: install
install:
	make install-homebrew
	make install-chezmoi

.PHONY: install-homebrew
install-homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update --force && brew upgrade
	echo "OK: Installed Homebrew"

.PHONY: install-brewfile
install-brewfile:
	brew bundle --global	
	echo "OK: Installed Brewfile tools"

.PHONY: install-chezmoi
install-chezmoi:
	sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply unvalley
	chezmoi cd && chezmoi apply
	echo "OK: Applied chezmoi"

.PHONY: install-rosetta2
install-rosetta2:
	sudo softwareupdate --install-rosetta

.PHONY: setup
setup:
	make setup-git-config
	make setup-mac

.PHONY: setup-git-config
setup-git-config:
	sh -c 'git config --global user.name "unvalley"'
	sh -c 'git config --global user.email "kirohi.code@gmail.com"'

# fishをdefault shellにする
.PHONY: setup-fish
setup-fish:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/fish

.PHONY: setup-fisher
setup-fisher:
	fisher update

.PHONY: setup-mac
setup-mac:
	# -------------------------
	# Finder
	# -------------------------
	# 拡張子まで表示
	defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
	# 隠しファイルを表示
	defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
	# パスバーを表示
	defaults write com.apple.finder ShowPathbar -bool "true"
	# 未確認ファイルを開くときの警告無効化
	defaults write com.apple.LaunchServices LSQuarantine -bool "false"
	# ゴミ箱を空にするときの警告無効化
	defaults write com.apple.finder WarnOnEmptyTrash -bool "false"
	# -------------------------
	# Battery
	# -------------------------
	# バッテリーを%表示
	defaults write com.apple.menuextra.battery ShowPercent -string "YES"
	# -------------------------
	# Key
	# -------------------------
	defaults write NSGlobalDomain KeyRepeat -int 1
	defaults write -g InitialKeyRepeat -int 12
	# ------------------------
	# Feedback
	# -------------------------
	# フィードバックを送信しない
	defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"
	# クラッシュレポート無効化
	defaults write com.apple.CrashReporter DialogType -string "none"
	# -------------------------
	# Trackpad
	# -------------------------
	defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "true"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool "true"
	defaults -currentHost write -g com.apple.mouse.tapBehavior -bool "true"
	## 軌跡の速さ
	defaults write -g com.apple.trackpad.scaling 3
	# -------------------------
	# Mouse
	# -------------------------
	## 軌跡の速さ
	defaults write -g com.apple.mouse.scaling 3
	## スクロールの速さ
	defaults write -g com.apple.scrollwheel.scaling 5
	


	





