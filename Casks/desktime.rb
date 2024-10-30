cask "desktime" do
  url_param = on_arch_conditional arm: "?m1", intel: ""

  version "6.0.4"
  sha256 arm:   "c8049809c068ec433f9d8912af889f36482de681a57e716d71133d1f032db51a",
         intel: "4281831da6db1eaab32848809a69dbfdc14113eb5de1b3080888576a7a56db0e"

  url "https://desktime.com/updates/electron/mac#{url_param}"
  name "DeskTime"
  desc "Time tracker with additional workforce management features"
  homepage "https://desktime.com/"

  livecheck do
    url :url
    strategy :header_match
    regex(/filename=DeskTime-(\d+(?:\.\d+)+)-(?:x64|arm64)\.dmg/)
  end

  app "DeskTime.app"

  uninstall quit: "DeskTime"

  zap trash: [
    "~/Library/Application Support/DeskTime",
    "~/Library/Logs/DeskTime",
    "~/Library/Preferences/com.desktime.DeskTime.plist",
  ]
end
