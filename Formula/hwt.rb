class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.6/hwt-darwin-arm64"
      sha256 "c04b02d2f379d422c5238788369e312aa05a4e5d7868afa7ea44afff94570b5c"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.6/hwt-darwin-x64"
      sha256 "56cca8c3f9599aa09dac401bc2aff61b59905b4ad7246a1a34dbad71fa225a41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.6/hwt-linux-arm64"
      sha256 "77c1e1fbb82d3ace5780ffb2cfddb825c5201c3ff4ca2761fbcdaa708bb9b244"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.6/hwt-linux-x64"
      sha256 "99ec40a3eb1e6c14e306bb40b0e6f3dd120dbd2431e28068b335afbaf4f66bd0"
    end
  end

  def install
    bin.install Dir["hwt-*"].first => "hwt"
  end

  def caveats
    <<~EOS
      hwt needs the Herdr app (herdr-app and hc) running for `hwt new`.
      Give your agents the hwt skill and session-start wiring, then check:

        hwt install all --lang en    # or ko; claude | codex | all
        hwt doctor
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hwt --version").strip
    assert_match "usage", shell_output("#{bin}/hwt task add --help")
  end
end
