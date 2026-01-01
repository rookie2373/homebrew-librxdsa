class Librxdsa < Formula
  desc "Lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/archive/refs/tags/D2026.1.2.tar.gz"
  version "D2026.1.2"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "GPL-3.0-or-later"

  def install
    system "make"
    lib.install "librxdsa.a"
    include.install Dir["include/*.h"]
  end
end
