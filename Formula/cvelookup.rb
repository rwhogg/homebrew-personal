class Cvelookup < Formula
  desc "Simple CLI to look up CVE details"
  homepage "https://github.com/rwhogg/cvelookup"
  url "https://github.com/rwhogg/cvelookup/archive/0.1.0.zip"
  sha256 "d2d0eebe557e796bfd9d191552d1aeb5be45d09fb236724d5656faa9e143cfb9"
  head "https://github.com/rwhogg/cvelookup.git"

  depends_on "rwhogg/personal-thirdparty/dragonwell8"
  depends_on "gradle" => :build

  def install
    ENV["JAVA_HOME"] = Formula["dragonwell8"].opt_prefix
    system "gradle", "installDist"
    libexec.install %w[build/install/cvelookup/bin build/install/cvelookup/lib]
    rm_f "#{libexec}/bin/cvelookup.bat"
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files libexec/"bin", :JAVA_HOME => "${JAVA_HOME:-#{ENV["JAVA_HOME"]}}"
  end

  test do
    system "false"
  end
end
