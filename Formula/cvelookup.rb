class Cvelookup < Formula
  desc "Simple CLI to look up CVE details"
  homepage "https://github.com/rwhogg/cvelookup"
  head "https://github.com/rwhogg/cvelookup"

  depends_on "dragonwell8"
  depends_on "gradle" => :build
  depends_on "unar" => :build

  def install
    ENV["JAVA_HOME"] = Formula["dragonwell8"].opt_prefix
    system "gradle", "installDist"
    libexec.install %w[build/install/golo/bin build/install/golo/docs build/install/golo/lib]
    bin.env_script_all_files libexec/"bin", :JAVA_HOME => "${JAVA_HOME:-#{ENV["JAVA_HOME"]}}"
  end

  test do
    system "false"
  end
end
