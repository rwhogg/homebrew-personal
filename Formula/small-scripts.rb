class SmallScripts < Formula
  desc "Small little scripts I've written. Don't expect them to be any good."
  homepage "https://github.com/rwhogg/small-scripts"
  url "https://github.com/rwhogg/small-scripts/archive/0.7.0.zip"
  sha256 "5bbfba6bd3b2a90ef58be898ed0b8479ad3e16b94a59d78598a7a446baf2720a"

  # depends_on "php" # I'll try to get rid of deps that use this eventually
  depends_on "ghostscript"
  depends_on "xinput"
  depends_on "p7zip"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    system "false"
  end
end
