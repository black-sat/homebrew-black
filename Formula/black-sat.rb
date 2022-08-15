class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage ""
  url "https://github.com/black-sat/black/archive/v0.9.0.tar.gz"
  sha256 "21f088d75b7584767f96004877afea9ae3a2416b074e2a35efe0aeae5fff00ee"

  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
  depends_on "catch2" => :build
  depends_on "nlohmann-json" => :build
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
