cask "instantview" do
  version "V2.9R0005"
  sha256 "968097338e8f11f90d0d5c71a34db9ddeda20b08443eb0bb1666025ec6c76a4f"

  url "https://www.siliconmotion.com/downloads/macOS_InstantView_#{version}.dmg"
  name "InstantView"
  desc "InstantView display application with UI"
  homepage "https://www.siliconmotion.com/download/3Xf/a/index.html"

  livecheck do
    url "https://www.siliconmotion.com/download/3Xf/a/index.html"
    strategy :page_match
    regex(%r{href=".*/macOS_InstantView_(V\d+\.\d+R\d+)\.dmg"}i)
  end

  app "macOS InstantView.app"
end
