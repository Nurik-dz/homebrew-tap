cask "sweep" do
  version "1.0"
  sha256 "620eb73b53a60a9e0c530e23fe0f755196bfa04a8fee9a8312cec534faa1c4ca"

  url "https://github.com/Nurik-dz/Sweep/releases/download/v#{version}/Sweep.zip"
  name "Sweep"
  desc "Cache cleaner and complete app uninstaller"
  homepage "https://github.com/Nurik-dz/Sweep"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Sweep.app"

  # Ad-hoc signed, not notarized: clear the download quarantine so it opens normally.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          "Sweep.app",
        writable_paths: ["Sweep.app"]
  end

  zap trash: [
    "~/Library/LaunchAgents/local.nurik.sweep.autoclean.plist",
    "~/Library/Preferences/local.nurik.sweep.plist",
    "~/Library/Saved Application State/local.nurik.sweep.savedState",
  ]
end
