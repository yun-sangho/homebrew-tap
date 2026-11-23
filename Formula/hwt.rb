class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.0/hwt-darwin-arm64"
      sha256 "d41c8233bfbfa22b6d2245f8588c66c328b9e89401b6c21b4d85fef3bfc1b757"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.0/hwt-darwin-x64"
      sha256 "05fe40138bf73b83377a7190805bd41d27cead6abffa3a0738e626f2b3d99590"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.0/hwt-linux-arm64"
      sha256 "495af124e543b1398539ae796e729bc0e63c7e584aa2fe003480fc44752910c1"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.2.0/hwt-linux-x64"
      sha256 "b78258caa696f904be55d479bfa8df5f131330f23a207198968ae6ee6a82856a"
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
