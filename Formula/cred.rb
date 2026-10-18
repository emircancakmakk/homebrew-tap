class Cred < Formula
  desc "Local encrypted credential vault"
  homepage "https://github.com/emircancakmakk/cred"
  url "https://github.com/emircancakmakk/cred/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "610c61dea9dac15af6ffffc26a59e7a350460611fde982cbe8c9d463d7d3d2b3"
  license "MIT"
  depends_on "go" => :build
  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end
  test do
    assert_match "Usage:", shell_output("#{bin}/cred --help")
  end
end
