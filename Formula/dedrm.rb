class Dedrm < Formula
  include Language::Python::Virtualenv

  desc "Remove Adobe Digital Editions (Adept) DRM from EPUB/PDF files"
  homepage "https://github.com/yun-sangho/ade-dedrm"
  url "https://github.com/yun-sangho/ade-dedrm/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "77e5625a3f9a68776a202c89996d7335a224988e0aa76db6213676dd73343279"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/yun-sangho/homebrew-tap/releases/download/dedrm-0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d519a83c74b9d7d3a36567c27dfce6a1ace659ed9cdeac386c755541117c2db5"
  end

  depends_on "python@3.12"

  resource "asn1crypto" do
    url "https://files.pythonhosted.org/packages/de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee/asn1crypto-1.5.1.tar.gz"
    sha256 "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c"
  end

  resource "oscrypto" do
    url "https://files.pythonhosted.org/packages/06/81/a7654e654a4b30eda06ef9ad8c1b45d1534bfd10b5c045d0c0f6b16fecd2/oscrypto-1.3.0.tar.gz"
    sha256 "6f5fef59cb5b3708321db7cca56aed8ad7e662853351e7991fcf60ec606d47a4"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("#{bin}/dedrm --help")
  end
end
