class Cred < Formula
  desc "Encrypted credential vault with local and shared Git profiles"
  homepage "https://github.com/emircancakmakk/cred"
  url "https://github.com/emircancakmakk/cred/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "815f6ce954adaf8120c6389461f117ee4184d557e18c915eda3c467a5b40ecb8"
  license "MIT"

  depends_on "go" => :build
  uses_from_macos "git"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "cred version #{version}", shell_output("#{bin}/cred --version")
    assert_match "Usage:", shell_output("#{bin}/cred --help")
    ENV["CRED_VAULT"] = (testpath/"missing-vault.age").to_s
    assert_match "Vault file: missing", shell_output("#{bin}/cred status")
  end
end
