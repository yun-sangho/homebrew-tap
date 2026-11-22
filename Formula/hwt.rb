class Hwt < Formula
  desc "Git worktrees as Herdr spaces, with a ledger for parallel coding agents"
  homepage "https://github.com/yun-sangho/hwt"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.1/hwt-darwin-arm64"
      sha256 "60ab945be5b844c86b88f077d760f123e6043608a18601b79357fa2733cb2ef4"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.1/hwt-darwin-x64"
      sha256 "d12059deb4ced4e35c6e3608322908afacbef96b6393c7358e577cb94ccd7d94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.1/hwt-linux-arm64"
      sha256 "66821ff401828c5333c335aea11d37d0ac2de9fa3295384331a44f273b4032ad"
    end
    on_intel do
      url "https://github.com/yun-sangho/hwt/releases/download/v0.1.1/hwt-linux-x64"
      sha256 "05d04141e5c35b37bacf21eb9cd895ba6e22bfc1f8529490ae0ae5b1fac361fd"
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
