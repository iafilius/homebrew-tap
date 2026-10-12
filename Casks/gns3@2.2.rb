cask "gns3@2.2" do
  version "2.2.61"
  sha256 "feabc88f23d19de56c26c07f9df937d691b28f335070dc8d2982a2dc97d804f7"

  url "https://github.com/GNS3/gns3-gui/releases/download/v#{version}/GNS3-#{version}.dmg"
  name "GNS3"
  name "Graphical Network Simulator 3"
  desc "GUI for the Dynamips Cisco router emulator (v2.2 LTS)"
  homepage "https://www.gns3.com/"

  depends_on macos: :monterey

  app "GNS3.app"

  zap trash: [
    "~/GNS3",
    "~/Library/Saved Application State/net.gns3.savedState",
  ]
end
