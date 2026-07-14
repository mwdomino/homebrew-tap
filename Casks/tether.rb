cask "tether" do
  version "0.5.0"
  sha256 "77ba917eed9b48254caa6110db7a45c2e339acfd571c5e11aff31df3e2b5d1fb"

  url "https://github.com/mwdomino/tether/releases/download/v#{version}/Tether_#{version}_darwin_arm64.zip"
  name "Tether"
  desc "Menubar status app for the tether remote-browser tool"
  homepage "https://github.com/mwdomino/tether"

  depends_on formula: "mwdomino/tap/tether"

  app "Tether.app"

  # Best-effort: set the host daemon to start at login if the CLI is present.
  postflight do
    cli = "#{HOMEBREW_PREFIX}/bin/tether"
    system_command cli, args: ["install"] if File.exist?(cli)
  end

  uninstall quit: "io.github.mwdomino.tether"
end
