class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage "https://www.black-sat.org"
  url "https://github.com/black-sat/black/archive/v0.10.8.tar.gz"
  sha256 "f5a41c950bf9f527f9807dbbbf9f076404488cde00d80062b2d5905fdcf2f032"

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
