cask "stayup" do
  version "0.6.9"

  on_arm do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_aarch64.dmg"
    sha256 "973e884068ab70220d6de8a013ec19d12319fd495cf0438ff2d9102b4ecac35b"
  end

  on_intel do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_x64.dmg"
    sha256 "f1c8f2eb2354006966b055a93720a2de4f215364e1ccdbe78fbaa091fff14b59"
  end

  name "StayUp"
  desc "Aggregates GitHub changelogs, YouTube, RSS and web pages into one feed"
  homepage "https://github.com/stayup-app/stayup-desktop"

  app "StayUp.app"

  zap trash: [
    "~/Library/Application Support/dev.r-sik.stayup-desktop",
    "~/Library/Preferences/dev.r-sik.stayup-desktop.plist",
    "~/Library/Saved Application State/dev.r-sik.stayup-desktop.savedState",
  ]
end
