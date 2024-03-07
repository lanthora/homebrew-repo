class Candy < Formula
  desc "Another virtual private network that supports peer-to-peer connections"
  homepage "https://github.com/lanthora/candy"
  url "https://github.com/lanthora/candy/archive/v5.0.tar.gz"
  sha256 "94c9947dc5fc834588ba32118a9c2a1ac07ec10d6091bf4ea3e0d58955c4a44e"
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
