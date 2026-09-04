class Librxdsa < Formula
  desc "Standalone and lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/releases/download/0.0.24/librxdsa-0.0.24.tar.gz"
  sha256 "eacb0bd9cd756d32d76586636328045c89b450d984a361561a3850efd2310fe7"
  license "GPL-3.0-or-later"

  def install
    Dir.chdir(version.to_s) if Dir.exist?(version.to_s)
    
    system "make"
    lib.install "librxdsa.a"
    include.install Dir["#{buildpath}/include/*.h"]
  end

  def caveats
    <<~EOS
      This library provides C algorithms. Include the header files and link with:
        -I#{include} -L#{lib} -lrxdsa
    EOS
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <librxdsa.h>
      int main() {
          hello_world();
          return 0;
      }
    EOS

    system ENV.cc, "test.c", "-I#{include}", "-L#{lib}", "-lrxdsa", "-o", "test-app"

    system "./test-app"
  end
end
