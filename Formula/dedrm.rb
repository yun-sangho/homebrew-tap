class Dedrm < Formula
  desc "Remove Adobe Digital Editions (Adept) DRM from EPUB/PDF files"
  homepage "https://github.com/yun-sangho/ade-dedrm"
  url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
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
