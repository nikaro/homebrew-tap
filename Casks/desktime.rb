cask "desktime" do
  url_param = on_arch_conditional arm: "?m1", intel: ""

  version "6.0.6"
  sha256 arm:   "2378166310543ec29ff4b1699bc44ad373e619a34274849f9915052f7b0714c0",
         intel: "0a17e5c5b3260b4800b1dc92e815f835be81a56f782bbbd9e0e93fe75761d614"

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
