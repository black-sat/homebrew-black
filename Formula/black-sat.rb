class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage ""
  url "https://github.com/black-sat/black/archive/v0.1.1.tar.gz"
  sha256 "662124d18477a04f9a22ee0ef7ddc55d9f23fd3cbf188bf1caf0323adf3fbbda"

  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
  depends_on "catch2" => :build
  depends_on "fmt"
  depends_on "z3" => :recommended
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
