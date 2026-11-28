class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.9/hwt-darwin-arm64"
      sha256 "7580d31c3c436f1debd38dcba4211df2678feb3ec9f710bc6fcf2dcc9d78932f"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.9/hwt-darwin-x64"
      sha256 "06ea1bd25042cc0f0cd0243e8d96b995ed2574c2c94a5cb058055cebf5d78a93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.9/hwt-linux-arm64"
      sha256 "2302dda8020b1ff939eb1b266acfb8d155b0175fd84af332fcbb75e1475ebb9c"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.9/hwt-linux-x64"
      sha256 "4439e2a51139d60dfd7bbccee6d7c09a7be127655074c826511312b251d09340"
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
