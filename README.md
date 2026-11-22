# yun-sangho/homebrew-tap

Personal Homebrew tap.

## Available formulae

### [lidwatch](https://github.com/yun-sangho/lidwatch)

Event-driven helper that turns off your Mac's internal display on lid close — even when sleep is blocked (`pmset disablesleep`, `caffeinate`, Amphetamine, clamshell mode).

```bash
brew install yun-sangho/tap/lidwatch && brew services start lidwatch
```

Enabled by default; lid close sleeps the display immediately. See the [lidwatch README](https://github.com/yun-sangho/lidwatch#readme) for usage (`lidwatch status`, `lidwatch disable`, etc.).

### [dedrm](https://github.com/yun-sangho/ade-dedrm)

Remove Adobe Digital Editions (Adept) DRM from EPUB/PDF files purchased through ADE.

```bash
brew install yun-sangho/tap/dedrm
```

Requires an authorized `~/.adept/activation.xml` (exported from Adobe Digital Editions). See the [ade-dedrm README](https://github.com/yun-sangho/ade-dedrm#readme) for usage (`dedrm <input> <output>`).

### [hwt](https://github.com/yun-sangho/hwt)

Git worktrees as Herdr spaces, with a ledger for running many coding agents in parallel on one repo (task list, inbox, merge queue). Prebuilt binaries for macOS and Linux.

```bash
brew install yun-sangho/tap/hwt && hwt doctor
```

Needs the Herdr app (`herdr-app`, `hc`). See the [hwt README](https://github.com/yun-sangho/hwt#readme).

## How to use this tap

```bash
brew tap yun-sangho/tap              # register the tap
brew install <formula-name>           # install any formula above
```
