cask "stayup" do
  version "0.24.2"

  on_arm do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_aarch64.dmg"
    sha256 "87c78b8c17ebfcaa0c9e70b2ccc7e64e7503bb1f0dc25545b14763279cac1c22"
  end

  on_intel do
    url "https://github.com/stayup-app/stayup-desktop/releases/download/v#{version}/StayUp_#{version}_x64.dmg"
    sha256 "d3e4eb8afbd7f888005a87407abb5104e9e0eb78ec2353f8b8bdd0ee02af6346"
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
