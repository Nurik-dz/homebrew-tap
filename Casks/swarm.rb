cask "swarm" do
  version "1.0"
  sha256 "03f58a41b698bde4510a931895c3ccec59235b5e46cb3e34581e5b0b65078405"

  url "https://github.com/Nurik-dz/Swarm/releases/download/v#{version}/Swarm.zip"
  name "Swarm"
  desc "Torrent client with plain-language status and streaming"
  homepage "https://github.com/Nurik-dz/Swarm"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Swarm.app"

  # Ad-hoc signed, not notarized: clear the download quarantine so it opens normally.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          "Swarm.app",
        writable_paths: ["Swarm.app"]
  end

  zap trash: [
    "~/Library/Application Support/Swarm",
    "~/Library/Preferences/com.nurik.swarm.plist",
    "~/Library/Saved Application State/com.nurik.swarm.savedState",
  ]
end
