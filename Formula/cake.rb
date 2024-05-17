class Cake < Formula
  desc "Candy GUI desktop application implemented by Qt"
  homepage "https://github.com/lanthora/cake"
  url "https://github.com/lanthora/cake/archive/refs/tags/5.8.5-1.tar.gz"
  sha256 "d4e59fe02b728e418cbfb73e1dec920487eca7cbf6c17a2ad2a30b7d1f64aa11"
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
