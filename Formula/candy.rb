class Candy < Formula
  desc "A reliable, low-latency, and anti-censorship virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v5.9.3.tar.gz"
  sha256 "0989245a20943d17491ce600340d388abbb8582f4e68e72f6e407deca043ad98"
  license "MIT"
  head "https://github.com/lanthora/candy.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "poco"
  depends_on "fmt"
  depends_on "spdlog"

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
