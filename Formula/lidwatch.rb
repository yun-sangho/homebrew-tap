class Lidwatch < Formula
  desc "Event-driven display sleep on lid close, even when sleep is blocked"
  homepage "https://github.com/yun-sangho/lidwatch"
  url "https://github.com/yun-sangho/lidwatch/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "a62130b908ab39e235b81dfdb7d40f94fbcdac126a013e2cfa9fc88f297b3400"
  license "MIT"
  head "https://github.com/yun-sangho/lidwatch.git", branch: "main"

  bottle do
    root_url "https://github.com/yun-sangho/homebrew-tap/releases/download/lidwatch-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "db537110dca137dcb58a54ac9f381a60607b406607c771a037a81fc340a5afa3"
  end
  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build",
           "--disable-sandbox",
           "-c", "release",
           "--arch", "arm64",
           "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/lidwatch"
  end

  service do
    run [opt_bin/"lidwatch", "watch"]
    keep_alive true
    run_at_load true
    log_path var/"log/lidwatch.log"
    error_log_path var/"log/lidwatch.log"
  end

  def caveats
    <<~EOS
      To start lidwatch at login and enable the feature:

        brew services start lidwatch
        lidwatch enable

      Or do it all at once:

        brew install yun-sangho/tap/lidwatch && \\
          brew services start lidwatch && lidwatch enable

      Useful commands:
        lidwatch status      # show current state
        lidwatch disable     # stop acting on lid close
        tail -f #{var}/log/lidwatch.log
    EOS
  end

  test do
    assert_match "lidwatch", shell_output("#{bin}/lidwatch version")
    assert_match "USAGE", shell_output("#{bin}/lidwatch help")
  end
end
