# typed: false

cask "desktime" do
  url_param = on_arch_conditional arm: "?m1", intel: ""

  version "6.0.3"
  sha256 arm:   "5dcb5b3ad275ed6bdf3b5b10be10e1990978312df384caf953cd03b2ad9fa2fa",
         intel: "3d4fc653c6c302312748d60c5b7007a02354d00b1f562497b95ffdf3c9cd1b84"

  url "https://desktime.com/updates/electron/mac#{url_param}"
  name "DeskTime"
  desc "Time tracker with additional workforce management features"
  homepage "https://desktime.com/"

  livecheck do
    url :url
    strategy :header_match
    regex /filename=DeskTime-(\d+(?:\.\d+)+)-(?:x64|arm64)\.dmg/
  end

  app "DeskTime.app"

  uninstall quit: "DeskTime"

  zap trash: [
    "~/Library/Application Support/DeskTime",
    "~/Library/Logs/DeskTime",
    "~/Library/Preferences/com.desktime.DeskTime.plist",
  ]
end
