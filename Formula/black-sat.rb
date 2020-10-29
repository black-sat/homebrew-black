class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage ""
  url "https://github.com/black-sat/black/archive/v0.3.0.tar.gz"
  sha256 "3f61122515655f3f830319a04b0331c6dd8d9ce9f40a7e9578e70869009ca48f"

  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
  depends_on "catch2" => :build
  depends_on "fmt"
  depends_on "z3"
  depends_on "cryptominisat" => :recommended

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make test"
  end
end
