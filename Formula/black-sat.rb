class BlackSat < Formula
  desc "BLACK (Bounded Lᴛʟ sAtisfiability ChecKer)"
  homepage ""
  url "https://github.com/black-sat/black/archive/v0.1.0.tar.gz"
  sha256 "104bfdaedb86fb5c9da436b0b60826ba93f9939b887b5b9348edf8a32f0d9998"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "hopscotch-map" => :build
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
