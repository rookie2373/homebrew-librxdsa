class Librxdsa < Formula
  desc "Standalone and lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/archive/refs/tags/R2026.2.7.1.tar.gz"
  version "R2026.2.7.1"
  sha256 "f6db3ced9151d3e8449c13aeaf676ffc33d973d3e2f30133c1a59957a2671c2e"
  license "GPL-3.0-or-later"
  revision 5

  def install
    system "make"
    lib.install "librxdsa.a"
    include.install Dir["include/*.h"]
  end

  def caveats
    <<~EOS
      This library provides C algorithms. Include the header files and link with:
        -I#{include} -L#{lib} -lrxdsa
    EOS
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
