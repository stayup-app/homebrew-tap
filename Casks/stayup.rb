cask "stayup" do
  version "0.24.7"

  on_arm do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_aarch64.dmg"
    sha256 "86a6f818bb7c1ff8f9d59ffdf6bdbf766b965ec04e16c3553e1130a6aad2b949"
  end

  on_intel do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_x64.dmg"
    sha256 "9e3aea6de7577cff1441cec5ed3f2fe4ff13dd7012ac9c9cab624628caca7b48"
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
