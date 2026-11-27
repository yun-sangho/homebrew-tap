class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.8/hwt-darwin-arm64"
      sha256 "363d41c7432fac3bdce5151c8e93d87f8f1c8d44443619b6b7b41dc9963f8c68"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.8/hwt-darwin-x64"
      sha256 "d5c504691422cf7ea916fbd138f353e1cb99b7af26a2b7eea1d8f6d9fbcc8980"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.8/hwt-linux-arm64"
      sha256 "6a3c5952bca6fc6d1ca4305f58a426945200fcaba639e65685058cc6fedd8126"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.8/hwt-linux-x64"
      sha256 "3d60c43e64cb0ba77c001047d854df67d237819d2d098e5fba4af0616a33deb7"
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
