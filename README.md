# StayUp Homebrew tap

Homebrew tap for [StayUp](https://github.com/stayup-app/stayup-desktop) — aggregates GitHub changelogs, YouTube, RSS and web pages into one feed.

**Website:** https://stayup-ui.vercel.app

## Install

```sh
brew install --cask stayup-app/tap/stayup
```

## Upgrade

```sh
brew upgrade --cask stayup
```

## Uninstall

```sh
brew uninstall --cask stayup
```

To also remove the application data:

```sh
brew uninstall --zap --cask stayup
```

## Releasing

`Casks/stayup.rb` is updated automatically by the [release workflow](https://github.com/stayup-app/stayup-desktop/blob/main/.github/workflows/release.yml)
of `stayup-desktop` on every tagged release: it downloads the published `.dmg`
artifacts, computes their checksums and pushes the bumped cask here. There is
normally no reason to edit the cask by hand.

## License

MIT
