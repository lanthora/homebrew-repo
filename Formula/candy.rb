class Candy < Formula
  desc "A reliable, low-latency, and anti-censorship virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v6.1.1.tar.gz"
  sha256 "b639f6c44208f285e7a4e9f815caa1ad8528ffae30e4548c02c86f3393345c5b"
  license "MIT"
  head "https://github.com/lanthora/candy.git"
  revision 1

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "fmt"
  depends_on "spdlog"
  depends_on "poco"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    etc.install "candy.cfg"
  end

  service do
    run [opt_bin/"candy", "-c", etc/"candy.cfg"]
    keep_alive true
    require_root true
  end

end
