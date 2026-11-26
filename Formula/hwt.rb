class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.3/hwt-darwin-arm64"
      sha256 "15dcbedbc7e75dae0ee44a1307f70238c6c5339e61f20745f141242788ff8d1a"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.3/hwt-darwin-x64"
      sha256 "e1c5631a5948907f4a2f7c30b48f617d09de900f64f6a68c6891757214a2ddb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.3/hwt-linux-arm64"
      sha256 "c176d481054dec46444c2696817933ce86363d8f2cf0b865e0e679de83c49549"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.3/hwt-linux-x64"
      sha256 "514a15aea8d6564af8d79909221784835d0e5270f85d5224da0b6272bd8c42ee"
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
