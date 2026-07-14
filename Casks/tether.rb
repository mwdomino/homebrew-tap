cask "tether" do
  version "0.5.1"
  sha256 "056c059f832aa4cc0ce6d9c9179136c6309b6d19b82b5aa93668e223b723e892"

  url "https://github.com/mwdomino/tether/releases/download/v#{version}/Tether_#{version}_darwin_arm64.zip"
  name "Tether"
  desc "Menubar status app for the tether remote-browser tool"
  homepage "https://github.com/mwdomino/tether"

  app "Tether.app"
  # The CLI ships inside the bundle; symlink it onto PATH so the app is
  # self-contained (no separate formula needed).
  binary "#{appdir}/Tether.app/Contents/MacOS/tether"

  # Set the host daemon to start at login. Guarded so it never aborts install.
  postflight do
    cli = "#{appdir}/Tether.app/Contents/MacOS/tether"
    system_command cli, args: ["install"] if File.exist?(cli)
  end

  uninstall quit:    "io.github.mwdomino.tether",
            launchctl: "com.tether.host"
end
