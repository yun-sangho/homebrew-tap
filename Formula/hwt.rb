class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.2/hwt-darwin-arm64"
      sha256 "f568a70bd61798145c227c93f0dca76aa2bdd36da3091fb65cb8108e2806e39b"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.2/hwt-darwin-x64"
      sha256 "65954d26bc5a9ed678d31314f211710d8adc1d1c9acf06dde5d82559b5d97a44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.2/hwt-linux-arm64"
      sha256 "606fc3f4ea244735e888d2fad1cf2b7fcfa75bc58f5b4f3e52d572949e126d17"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.2/hwt-linux-x64"
      sha256 "0a27f671ee94d4fc5f89d7ed8b7073b99d9b57beb79866481051a0d3a2edfc04"
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
