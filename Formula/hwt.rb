class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.1/hwt-darwin-arm64"
      sha256 "7488aa4d6a8be1e835d2f63a8f34d30b90ce506cde4b3a49b968e4ee48d33081"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.1/hwt-darwin-x64"
      sha256 "336a96f2cbed87eb029cbd9936d87f44e99cf0a1a5446f4965ffc3d7f383120a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.1/hwt-linux-arm64"
      sha256 "fd63f0fe520c0309ef434d2e2df313b95cb48abd59a832c5adac1a4d17773cd7"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.1/hwt-linux-x64"
      sha256 "9dca4763725986f874499dbe9c49c4e78b2dcc015375c8ef4241d003f3fe9cea"
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
