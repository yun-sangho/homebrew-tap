class Dedrm < Formula
  include Language::Python::Virtualenv

  desc "Remove Adobe Digital Editions (Adept) DRM from EPUB/PDF files"
  homepage "https://github.com/yun-sangho/ade-dedrm"
  url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "openssl@3"
  depends_on "python@3.12"

  resource "cffi" do
    url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
  end

  resource "cryptography" do
    url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
  end

  resource "lxml" do
    url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
  end

  resource "pycparser" do
    url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
  end

  resource "pycryptodome" do
    url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "834dea73e631e5d9375db9c6af942964eeda57b73ce26a313cfcef59ed69ef53"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("#{bin}/dedrm --help")
  end
end
