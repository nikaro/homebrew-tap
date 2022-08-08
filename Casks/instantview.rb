cask "instantview" do
  version "V3.11R0001"
  sha256 "77aaa43a307a669ce0c400ae6b8273b92647b79bec29ed6c655ccbe14e367cbb"

  url "https://www.siliconmotion.com/downloads/macOS_InstantView_#{version}.dmg"
  name "InstantView"
  desc "Driver for Silicon Motion's SM76x USB display/docking station SoC"
  homepage "https://www.siliconmotion.com/downloads/index.html"

  livecheck do
    url "https://www.siliconmotion.com/downloads/index.html"
    strategy :page_match
    regex(%r{href=".*/macOS_InstantView_(V\d+\.\d+R\d+)\.dmg"}i)
  end

  auto_updates true

  app "macOS InstantView.app"
end
