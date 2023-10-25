class Candy < Formula
  desc "A easy-to-deploy and peer-to-peer virtual private network"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v2.4.tar.gz"
  sha256 "61128b9e0993e2ba32f73d39bbf6f859c03431c7fb382ca1d869096d7b6d0944"
  license "MIT"
  revision 1

  depends_on "cmake" => :build
  depends_on "argp-standalone" => :build
  depends_on "uriparser" => :build
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
