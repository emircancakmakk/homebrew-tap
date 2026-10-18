class Cred < Formula
  desc "Local encrypted credential vault"
  homepage "https://github.com/emircancakmakk/cred"
  url "https://github.com/emircancakmakk/cred/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c9bedf34899e3d70e1e8be182337cc93231662c7dbf6bc19687d6d0edcd4ee05"
  license "MIT"
  depends_on "go" => :build
  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end
  test do
    assert_match "Usage:", shell_output("#{bin}/cred --help")
  end
end
