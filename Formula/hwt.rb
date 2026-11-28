class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.3/hwt-darwin-arm64"
      sha256 "3eff78466261dd78c3f84d18bf8a5ea9dc221bd8e0149359beef4c978af49fb8"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.3/hwt-darwin-x64"
      sha256 "5f566f3440a3d4eddfcb5bf17e1415ee93cc3714ce2c7f5b25ddf8aa7e6de3e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.3/hwt-linux-arm64"
      sha256 "3bd7d459d94e790aaeef0a7d9514362d3b2d5c0bb2f6b44582926f2bd7dde7c1"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.4.3/hwt-linux-x64"
      sha256 "54c13c5bfa280944ada334ebcc83e3a7c5395c370b6a90bb35ed91d18127e7ed"
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
