class Dedrm < Formula
  desc "Remove Adobe Digital Editions (Adept) DRM from EPUB/PDF files"
  homepage "https://github.com/yun-sangho/ade-dedrm"
  url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "c06fc6ce05605e10ce356cae0e64d9a168228dc0406668e0b0f1d79031dbec88"
  license "GPL-3.0-or-later"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", libexec
    system libexec/"bin/python", "-m", "pip", "install", "--prefer-binary", buildpath
    bin.install_symlink libexec/"bin/dedrm"
    bin.install_symlink libexec/"bin/ade-dedrm"
  end

  test do
    assert_match "usage", shell_output("#{bin}/dedrm --help")
  end
end
