class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.4/hwt-darwin-arm64"
      sha256 "d91b05d0533d7ffa6f7d5e6c35b887db3a705f34dbd329d41e1aa7918205fef2"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.4/hwt-darwin-x64"
      sha256 "9c187fe3da1fb87e4a4244128301f314cac1f46bfee6a9ba26a93802e55dfc58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.4/hwt-linux-arm64"
      sha256 "e56f62d5a85cfb7388fc75a8cfc9f1d79a0778cf55b827b14a136aaeb5a98b44"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.4/hwt-linux-x64"
      sha256 "3e7f301eedaaa440a576af60f93fd6abe4b0ff2b8f0d2f9c415e54fa9f03c0b9"
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
