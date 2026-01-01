class Librxdsa < Formula
  desc "Lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/archive/refs/tags/D2026.1.2.tar.gz"
  version "D2026.1.2"
  sha256 "2445442f0e392150528e33a5c5eb2ca5ef3695a3ed760289d8c1a77bf53ef257"
  license "GPL-3.0-or-later"

  def install
    system "make"
    lib.install "librxdsa.a"
    include.install Dir["include/*.h"]
  end
end
