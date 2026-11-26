class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.4/hwt-darwin-arm64"
      sha256 "70fabc6cacf93627411518320ed3015758e9fe699c26c100758a7df081ffdb14"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.4/hwt-darwin-x64"
      sha256 "56cf59722fb8612abcc8fa6a7993b5f1728d98b61b057e1366e539471c8a99da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.4/hwt-linux-arm64"
      sha256 "c81a4b20684203553092e56b5497e90f313bf77f8a014940401c6db9d77b1739"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.3.4/hwt-linux-x64"
      sha256 "6eaeb276ca86b6ef271dd212951807848328ad9b3f86c382bd0dd825134f440f"
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
