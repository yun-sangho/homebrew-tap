class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.3/hwt-darwin-arm64"
      sha256 "e94d6273761fa813c68dd878667dbda90195e9ce8135e7aa7c7a0fde988064f0"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.3/hwt-darwin-x64"
      sha256 "98bc899434b217fe05dd482c0347bdae686f7f8f4f8ec90e1cc7fa821845f250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.3/hwt-linux-arm64"
      sha256 "d4f1163050b2a7ad80c7396625512b5b044440b831455d55d344569d74aa4818"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.3/hwt-linux-x64"
      sha256 "8601aede97b98a90e498d85fc80740df8a09d58573b905611764ed64dac61eeb"
    end
  end

  def install
    bin.install Dir["hwt-*"].first => "hwt"
  end

  def caveats
    <<~EOS
      hwt needs the Herdr app (herdr-app and hc) running for `hwt new`.
      Check your setup:

        hwt doctor

      Optional shell wrapper (leaves you in the main checkout after `hwt rm`):

        eval "$(hwt shell-init zsh)"    # in ~/.zshrc (or bash / fish)
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hwt --version").strip
    assert_match "usage", shell_output("#{bin}/hwt task add --help")
  end
end
