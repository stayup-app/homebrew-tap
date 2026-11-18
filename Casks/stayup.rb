cask "stayup" do
  version "0.24.8"

  on_arm do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_aarch64.dmg"
    sha256 "69f880fa5ac8913cf3268350de28e9d52b472fc5d651dcb5f19189e253f8c789"
  end

  on_intel do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_x64.dmg"
    sha256 "16c390cb7d7e19aeb7ae0acf8a389ae6d64e5b36b1cffe50fa63c6e56ed779b0"
  end

  name "StayUp"
  desc "Aggregates GitHub changelogs, YouTube, RSS and web pages into one feed"
  homepage "https://github.com/stayup-app/stayup-desktop"

  app "StayUp.app"

  # The app is not notarized: drop the quarantine flag so Gatekeeper does not
  # report it as damaged.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/StayUp.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.r-sik.stayup-desktop",
    "~/Library/Preferences/dev.r-sik.stayup-desktop.plist",
    "~/Library/Saved Application State/dev.r-sik.stayup-desktop.savedState",
  ]
end
