class Librxdsa < Formula
  desc "Standalone and lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/releases/download/0.0.7/0.0.7.tar.gz"
  sha256 "5eebdd7efff08a941442cadce6da98d9560103d25f8b6c1c1bc22b624f5d3d09"
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
