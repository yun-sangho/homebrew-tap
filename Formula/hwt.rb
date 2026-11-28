class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.0/hwt-darwin-arm64"
      sha256 "319821c43b8fe4d3b3ddbf5e02864d1de4c677706e8ec89083014f21d199216c"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.0/hwt-darwin-x64"
      sha256 "3e37e00fd6810a3777e2d2a58bd1256b0d79f1a81cc8545793f831096c40a7b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.0/hwt-linux-arm64"
      sha256 "61570dc14b6663e25d4448be06c816a85278269cd34f28e2c1bba604ebc8b79b"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.0/hwt-linux-x64"
      sha256 "03d8c9e483e637764e5073be363d543c9aa7b01ca6f5e056c005a90176547e15"
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
