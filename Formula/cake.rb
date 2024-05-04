class Cake < Formula
  desc "Candy GUI desktop application implemented by Qt"
  homepage "https://github.com/lanthora/cake"
  url "https://github.com/lanthora/cake/archive/refs/tags/5.8-1.tar.gz"
  sha256 "eaed3eb4d27debf49961869eebbec80c90e770c12c0cc3a6e64cc0d452ab2af2"
  license "MIT"
  head "https://github.com/lanthora/cake.git"

  depends_on "cmake" => :build
  depends_on "uriparser"
  depends_on "openssl"
  depends_on "poco"
  depends_on "spdlog"
  depends_on "qt"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

end
