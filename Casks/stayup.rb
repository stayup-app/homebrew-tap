cask "stayup" do
  version "0.24.1"

  on_arm do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_aarch64.dmg"
    sha256 "c002d0f07f380084412df71a9273a540f807cd94ec1e05a021e4f488aa173497"
  end

  on_intel do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_x64.dmg"
    sha256 "6d63d5d5d5ff8b4b4336618f450a7d6c1093a846953a5ae80bd99d75ab1001ba"
  end

  name "StayUp"
  desc "Aggregates GitHub changelogs, YouTube, RSS and web pages into one feed"
  homepage "https://github.com/stayup-app/stayup-desktop"

  app "StayUp.app"

  # The app is not notarized: drop the quarantine flag so Gatekeeper does not
  # report it as damaged.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/StayUp.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.r-sik.stayup-desktop",
    "~/Library/Preferences/dev.r-sik.stayup-desktop.plist",
    "~/Library/Saved Application State/dev.r-sik.stayup-desktop.savedState",
  ]
end
