class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage "https://www.black-sat.org"
  url "https://github.com/black-sat/black/archive/v0.9.1.tar.gz"
  sha256 "e4abb05712a06ae91c6847e8ca8f3056355bac8f4835c8146ea10655f631bbf5"

  depends_on "llvm" => :build
  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
  depends_on "catch2" => :build
  depends_on "nlohmann-json" => :build
  depends_on "fmt"
  depends_on "z3"
  depends_on "cryptominisat" => :recommended

  def install
    ENV["CC"] = "#{HOMEBREW_PREFIX}/opt/llvm/bin/clang"
    ENV["CXX"] = "#{HOMEBREW_PREFIX}/opt/llvm/bin/clang++"
    ENV["LDFLAGS"] = "-L#{HOMEBREW_PREFIX}/opt/llvm/lib -Wl,-rpath,#{HOMEBREW_PREFIX}/opt/llvm/lib"  
    ENV["CXXFLAGS"] = "-I#{HOMEBREW_PREFIX}/opt/llvm/include"
    system "cmake", ".", "-DENABLE_MINISAT=NO", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "make test"
  end
end
