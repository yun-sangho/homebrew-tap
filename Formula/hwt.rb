class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.5/hwt-darwin-arm64"
      sha256 "a54c1a842b538a256954ef1aeb15eb9d44b8d8a599d4959064f8c8b8cb0dd07c"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.5/hwt-darwin-x64"
      sha256 "599370b0996b890ee07a21af5381ce28ccd2dcf08d43ce25432c31e4b4370b46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.5/hwt-linux-arm64"
      sha256 "3b84257fbb8c826845ebd24c18e86ff3e3d39a0d841f441724132dad188f84fb"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.5/hwt-linux-x64"
      sha256 "ddf0af1c4ad3d402c47f4e594b19764ec7bc6015dc8dfbac1bcb242a2dc603a5"
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
