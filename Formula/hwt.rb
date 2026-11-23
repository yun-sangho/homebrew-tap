class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.1/hwt-darwin-arm64"
      sha256 "9ae17de88502b49897e2ef53e035366c2a26749f5fd59b70f81571819f40d338"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.1/hwt-darwin-x64"
      sha256 "1774bd53103e237f309a7907f3bc13d83f590e4d99f0151294f1cbe2ed9c171a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.1/hwt-linux-arm64"
      sha256 "ae442d12bbf0e8f751a16bcdc615a4ea9258ce71422fdf4c68a63f5ed8fcfe43"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.1/hwt-linux-x64"
      sha256 "49e200248a40a246fead867ad697c21c828281050d5bcca7f5eea1bd5800dfb6"
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
