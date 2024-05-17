class Candy < Formula
  desc "A reliable, low-latency, and anti-censorship virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v5.8.5.tar.gz"
  sha256 "ade6f8021f6d5e60e35d1cd0433c3dd1d3c17384e4acd282b1691ca1b585ca18"
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
    etc.install "candy.cfg"
  end

  service do
    run [opt_bin/"candy", "-c", etc/"candy.cfg"]
    keep_alive true
    require_root true
    error_log_path var/"log/candy.log"
    log_path var/"log/candy.log"
  end

end
