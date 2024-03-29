class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage "https://www.black-sat.org"
  url "https://github.com/black-sat/black/archive/v0.10.6.tar.gz"
  sha256 "c1a9126e1d338268a50ba1e234fee3dc3702d5f5f4b715966ab90110d4d60ec1"

  depends_on "llvm" => :build
  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
  depends_on "catch2" => :build
  depends_on "nlohmann-json" => :build
  depends_on "fmt"
  depends_on "z3"
  depends_on "cryptominisat" => :recommended

  def install
    ENV["CC"]=Formula["llvm"].opt_bin/"clang"
    ENV["CXX"]=Formula["llvm"].opt_bin/"clang++"
    ENV["LDFLAGS"]="-L#{Formula["llvm"].opt_lib} -Wl,-rpath,#{Formula["llvm"].opt_lib}"
    ENV["CXXFLAGS"]="-I#{Formula["llvm"].opt_include}"
    system "cmake", ".", "-DENABLE_MINISAT=NO", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make test"
  end
end
