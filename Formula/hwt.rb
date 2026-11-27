class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.7/hwt-darwin-arm64"
      sha256 "391e853392d71992411696b84313ee237e4e6bd188062ed5553eb43b3a4308f0"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.7/hwt-darwin-x64"
      sha256 "e4a613b312c74af0de8487a266c21cfa12b134c9e87796144eef91b7b48a3366"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.7/hwt-linux-arm64"
      sha256 "a443994e6b2e01bd1a772052a41d3873842be9c3ec2f7496f21a60a3b03f189f"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.7/hwt-linux-x64"
      sha256 "0de8d62c17bbe071c72219f357fed13cada735b51964c6a4a1d408197d2525b6"
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
