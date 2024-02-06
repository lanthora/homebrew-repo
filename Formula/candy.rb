class Candy < Formula
  desc "Another virtual private network that supports peer-to-peer connections"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v3.9.1.tar.gz"
  sha256 "d1929747035553f3b9381cb7bacbd9fcd862252d66dcb5fef3324387befb5512"
  license "MIT"
  head "https://github.com/lanthora/candy.git"

  depends_on "cmake" => :build
  depends_on "argp-standalone" => :build
  depends_on "uriparser" => :build
  depends_on "pkg-config" => :build
  depends_on "libconfig"
  depends_on "openssl"
  depends_on "spdlog"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    etc.install "candy.conf"
  end

  service do
    run [opt_bin/"candy", "-c", etc/"candy.conf"]
    keep_alive true
    require_root true
    error_log_path var/"log/candy.log"
    log_path var/"log/candy.log"
  end

end
