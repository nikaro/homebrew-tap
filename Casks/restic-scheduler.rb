cask "restic-scheduler" do
  version "1.3.0"
  sha256 "47f2338ea780cc6d19cb1b1b6a545b4fca400d9b1d49bbdf3a5d8ac26e664b43"

  url "https://github.com/sergeymakinen/ResticScheduler/releases/download/v#{version}/Restic.Scheduler.v#{version}.zip"
  name "Restic Scheduler"
  desc "Menu bar app to perform scheduled backups using restic"
  homepage "https://github.com/sergeymakinen/ResticScheduler"

  app "Restic Scheduler.app"

  zap trash: [
    "~/Library/Application Scripts/ru.makinen.ResticScheduler",
    "~/Library/Application Support/ru.makinen.ResticScheduler.ResticRunner",
    "~/Library/Caches/ru.makinen.ResticScheduler.ResticRunner",
    "~/Library/Library/Containers/ru.makinen.ResticScheduler",
  ]
end
