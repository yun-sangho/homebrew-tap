class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.2/hwt-darwin-arm64"
      sha256 "64abfadf133e4598e41d5cc4a5e5d7d61c7d1f7c9ed710c632f6a546ab991c18"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.2/hwt-darwin-x64"
      sha256 "80bb2c58809e0df30db1b8e3ca1cd9f6d75a51e530f2512d9bd2ce6bdc0a7415"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.2/hwt-linux-arm64"
      sha256 "4ecc81cc79c8305b96498161c47b3486c8d2159af192694825807c67fe33d3c7"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.2/hwt-linux-x64"
      sha256 "87df5bfb5b5ff025b029e0aafae759bc3bc307faaff1dabe173473341833b364"
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
