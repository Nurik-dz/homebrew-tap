cask "snag" do
  version "1.0"
  sha256 "0bb453f9c13f7d86dd3a63bf236efab2ffee2b5ff6d04836a0d73fab9410d233"

  url "https://github.com/Nurik-dz/Snag/releases/download/v#{version}/Snag.zip"
  name "Snag"
  desc "YouTube downloader for the best available quality"
  homepage "https://github.com/Nurik-dz/Snag"

  depends_on arch: :arm64
  depends_on formula: ["deno", "ffmpeg", "yt-dlp"]
  depends_on macos: :tahoe

  app "Snag.app"

  # Ad-hoc signed, not notarized: clear the download quarantine so it opens normally.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "."],
        chdir:          "Snag.app",
        writable_paths: ["Snag.app"]
  end

  zap trash: [
    "~/Library/Application Support/Snag",
    "~/Library/Preferences/local.nurik.snag.plist",
    "~/Library/Saved Application State/local.nurik.snag.savedState",
  ]
end
