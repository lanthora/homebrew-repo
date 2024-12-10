class Candy < Formula
  desc "A reliable, low-latency, and anti-censorship virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v5.10.5.tar.gz"
  sha256 "5c251357f7e50105b24ad8b6a74a1b1ad2578de91a926aa1a2eb3e80a7098d6d"
  license "MIT"
  head "https://github.com/lanthora/candy.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "fmt"
  depends_on "spdlog"

  def install
    system "cmake", "-S", ".", "-B", "build", "-DCANDY_STATIC_POCO=1", "-DHOMEBREW_ALLOW_FETCHCONTENT=ON", *std_cmake_args
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
