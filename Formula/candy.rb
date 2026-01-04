class Candy < Formula
  desc "A reliable, low-latency, and anti-censorship virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v6.1.4.tar.gz"
  sha256 "88b30fd9f0cdc57c7ffa0553cb35aaf9b574256242bd4670af2592724d0ec05f"
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
