class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage "https://www.black-sat.org"
  url "https://github.com/black-sat/black/archive/v25.03.0.tar.gz"
  sha256 "49b5f42c19ac835aae6db500f2a9dbe2af332e129eef6a7fa9fa2625954d3504"

  version_scheme 1

  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
  depends_on "catch2" => :build
  depends_on "nlohmann-json" => :build
  depends_on "fmt"
  depends_on "z3"
  depends_on "cryptominisat" => :recommended

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make test"
  end
end
