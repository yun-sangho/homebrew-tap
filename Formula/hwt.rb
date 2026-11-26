class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.0/hwt-darwin-arm64"
      sha256 "7740edb7e3634edd8247064b1ee71187f846701a288315f50c129b44b8ad16bb"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.0/hwt-darwin-x64"
      sha256 "a552b2c058f7b606f2643fad1acb2a2d5d0fcd1f3eec6fffd8a4ed8b51f2713f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.0/hwt-linux-arm64"
      sha256 "4a0bac6b2e02beb29939e0f712cdb83d67e2fd074fa10954c6a944ba05bc02fc"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.0/hwt-linux-x64"
      sha256 "4149bb70b537194e9fbd42140f8d34070b753617644c6d2125adc637bed04c18"
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
