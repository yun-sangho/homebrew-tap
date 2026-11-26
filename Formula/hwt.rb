class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.1/hwt-darwin-arm64"
      sha256 "7a72da9302272db1c3f079b9dbdd7153dbfd4a19f2a531c6b03b4a9fb31c83ee"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.1/hwt-darwin-x64"
      sha256 "2d3af95d357920e1e67a3ad1483ba41c637344d0038205782744c6322ed160b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.1/hwt-linux-arm64"
      sha256 "103f0eb144b7ca6cba1f4e7b20df34d13d5141b298fe4c4b02cfe3e2f21eebab"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.1/hwt-linux-x64"
      sha256 "ce16834ad851686f3c6ed0b203ffb4e4e082a423190214d140c62c8850d05bd5"
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
