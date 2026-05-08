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

## How to use this tap

```bash
brew tap yun-sangho/tap              # register the tap
brew install <formula-name>           # install any formula above
```
