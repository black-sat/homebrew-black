# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Boolector < Formula
  desc "Boolector SMT solver"
  homepage ""
  url "https://github.com/Boolector/boolector/archive/refs/tags/3.2.1.tar.gz"
  sha256 "0273347f6b24be406e5d37fd3681d64847a0eecb4131006a6afb8f120b69c4dd"

  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "contrib/setup-btor2tools.sh"
    system "contrib/setup-lingeling.sh"
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hopscotch-map`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
