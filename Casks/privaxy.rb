# typed: false

cask "privaxy" do
  version "0.5.2"
  sha256 "d64356e3f641e5442dc8f3a13bae87392515a1a64d43d3731bb06ab0e6b31452"

  url "https://github.com/Barre/privaxy/releases/download/v#{version}/Privaxy_#{version}_universal.dmg"
  name "Privaxy"
  desc "Next generation tracker and advertisement blocker"
  homepage "https://github.com/Barre/privaxy"

  app "Privaxy.app"

  uninstall quit: "Privaxy"

  zap trash: [
    "~/Library/Caches/net.privaxy",
    "~/Library/Preferences/net.privaxy",
    "~/Library/Saved Application State/net.privaxy.savedState",
    "~/Library/WebKit/net.privaxy",
  ]
end
