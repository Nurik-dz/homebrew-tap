# Nurik-dz Homebrew Tap

Native macOS apps, installable with [Homebrew](https://brew.sh).

```sh
brew tap nurik-dz/tap
brew install --cask <app>
```

| App | Install | What it is |
| --- | --- | --- |
| [Sweep](https://github.com/Nurik-dz/Sweep) | `brew install --cask nurik-dz/tap/sweep` | Cache cleaner and complete app uninstaller |
| [Snag](https://github.com/Nurik-dz/Snag) | `brew install --cask nurik-dz/tap/snag` | YouTube downloader for the best available quality |
| [Swarm](https://github.com/Nurik-dz/Swarm) | `brew install --cask nurik-dz/tap/swarm` | Torrent client with plain-language status and streaming |
| [Stalker Player](https://github.com/Nurik-dz/StalkerPlayer) | `brew install --cask nurik-dz/tap/stalker-player` | Player for Stalker / Ministra IPTV portals |

All apps need macOS 26 or later on Apple silicon.

Update: `brew upgrade --cask <app>` · Remove: `brew uninstall --cask <app>` (add `--zap` to also remove settings and caches).

The apps are ad-hoc signed and not notarized. The casks clear the download quarantine so they open normally; a manual download from Releases may need **System Settings → Privacy & Security → Open Anyway** the first time.
