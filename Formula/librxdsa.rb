class Librxdsa < Formula
  desc "Standalone and lightweight C algorithms library"
  homepage "https://github.com/rookie2373/librxdsa"
  url "https://github.com/rookie2373/librxdsa/releases/download/0.0.23/librxdsa-0.0.23.tar.gz"
  sha256 "f64998b4df3db2f19c4e1d36b5aef84cdb14de01023c8977b221412eb77e632a"
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
