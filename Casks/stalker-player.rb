cask "stalker-player" do
  version "1.0"
  sha256 "161bdd6a6418da62e74abe5e0859c7fb55c07f4659405cf7baa713a5b0499a5f"

  url "https://github.com/Nurik-dz/StalkerPlayer/releases/download/v#{version}/Stalker-Player.zip"
  name "Stalker Player"
  desc "Player for Stalker and Ministra IPTV portals"
  homepage "https://github.com/Nurik-dz/StalkerPlayer"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Stalker Player.app"

  # Ad-hoc signed, not notarized: clear the download quarantine so it opens normally.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          "Stalker Player.app",
        writable_paths: ["Stalker Player.app"]
  end

  zap trash: [
    "~/Library/Caches/StalkerTV",
    "~/Library/Logs/StalkerPlayer",
    "~/Library/Preferences/com.nurik.stalkerplayer.plist",
    "~/Library/Saved Application State/com.nurik.stalkerplayer.savedState",
  ]
end
