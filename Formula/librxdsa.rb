class Librxdsa < Formula
  desc "Lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/archive/refs/tags/v0.0.1-snapshot.tar.gz"
  sha256 "b364efbae1e7c4ffda50085f3c81254a78b5b6b70885eefe43525e570768a81a"
  license "GPL-3.0-or-later"

  def install
    system "make"
    lib.install "libdsa.a"
    include.install Dir["include/*.h"]
  end
end
