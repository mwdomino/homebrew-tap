cask "tether" do
  version "0.5.2"
  sha256 "ad34030323693ac4a6c4ffb27f66e32630ab716b5d28c7c986355b6c7f66ba2d"

  url "https://github.com/mwdomino/tether/releases/download/v#{version}/Tether_#{version}_darwin_arm64.zip"
  name "Tether"
  desc "Menubar status app for the tether remote-browser tool"
  homepage "https://github.com/mwdomino/tether"

  app "Tether.app"
  # The CLI ships inside the bundle; symlink it onto PATH so the app is
  # self-contained (no separate formula needed).
  binary "#{appdir}/Tether.app/Contents/MacOS/tether"

  # Best-effort daemon autostart. must_succeed:false so a Gatekeeper kill on an
  # unnotarized build cannot abort the whole install.
  postflight do
    cli = "#{appdir}/Tether.app/Contents/MacOS/tether"
    system_command cli, args: ["install"], must_succeed: false if File.exist?(cli)
  end

  uninstall quit:    "io.github.mwdomino.tether",
            launchctl: "com.tether.host"
end
