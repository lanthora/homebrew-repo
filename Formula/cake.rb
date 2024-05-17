class Cake < Formula
  desc "Candy GUI desktop application implemented by Qt"
  homepage "https://github.com/lanthora/cake"
  url "https://github.com/lanthora/cake/archive/refs/tags/5.8.4-1.tar.gz"
  sha256 "ce321a5cfbd753001bcd25f7378befe884c112557c72bd659a4f3bba1556ae41"
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
