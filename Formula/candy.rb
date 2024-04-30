class Candy < Formula
  desc "A reliable, low-latency, and anti-censorship virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v5.7.tar.gz"
  sha256 "371fa21ff9db3136c2a3292685a6789abe75327cc6275d50d0d6abe3c3d4ffba"
  license "MIT"
  head "https://github.com/lanthora/candy.git"

  depends_on "cmake" => :build
  depends_on "argp-standalone" => :build
  depends_on "pkg-config" => :build
  depends_on "uriparser"
  depends_on "libconfig"
  depends_on "openssl"
  depends_on "poco"
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
