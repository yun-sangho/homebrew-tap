class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.2/hwt-darwin-arm64"
      sha256 "67636515d6679f82c5fd8a2898a6d006537108e4c37eb9701ce507ce9d5d4e19"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.2/hwt-darwin-x64"
      sha256 "9cc1de9724e3c3496108800a86363a436fda66d41f8d6211b9272a05dea47be8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.2/hwt-linux-arm64"
      sha256 "5e64f17095472ea4604e96b64e933db360c501f8caba82fa652d9601f66b7547"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.2/hwt-linux-x64"
      sha256 "7c01b283a072af723645ac4260c73a9536a69f0caf540f5e1de9fa53ed0d6d47"
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
