class Mixum < Formula
  desc "Host-side runtime for agents that need a real machine"
  homepage "https://github.com/EmergeShift/MixumART"
  url "https://github.com/EmergeShift/MixumART/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_COMPUTE_ON_RELEASE"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", "crates/mixum-cli", "--bin", "mixum", "--bin", "mixum-artd", *std_cargo_args
  end

  test do
    assert_match "mixum", shell_output("#{bin}/mixum --version")
    assert_match "mixum-artd", shell_output("#{bin}/mixum-artd --help", 2)
  end
end
