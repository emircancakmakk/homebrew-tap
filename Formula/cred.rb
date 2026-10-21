class Cred < Formula
  desc "Encrypted credential vault with local and shared Git profiles"
  homepage "https://github.com/emircancakmakk/cred"
  url "https://github.com/emircancakmakk/cred/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "0711e84cf076e3d85094076662167e9445ad7a401999df60801581eb5016b6a4"
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
