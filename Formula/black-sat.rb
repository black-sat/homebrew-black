class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage "https://www.black-sat.org"
  url "https://github.com/black-sat/black/archive/v26.05.0.tar.gz"
  sha256 "2eec94e524d8b302832137c20c531a8aff2b474930b408fc264676b034723297"

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
