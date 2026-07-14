cask "tether" do
  version "0.5.0"
  sha256 "77ba917eed9b48254caa6110db7a45c2e339acfd571c5e11aff31df3e2b5d1fb"

  url "https://github.com/mwdomino/tether/releases/download/v#{version}/Tether_#{version}_darwin_arm64.zip"
  name "Tether"
  desc "Menubar status app for the tether remote-browser tool"
  homepage "https://github.com/mwdomino/tether"

  # Pulls in the `tether` CLI (host daemon + agent commands).
  depends_on formula: "mwdomino/tap/tether"

  app "Tether.app"

  # Set up the host daemon to start at login (the GUI registers its own
  # login item on first launch).
  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/tether", args: ["install"]
  end

  uninstall quit: "io.github.mwdomino.tether"
end
