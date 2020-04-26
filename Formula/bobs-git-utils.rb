class BobsGitUtils < Formula
  desc "Bob W. Hogg's Git utilities"
  homepage "https://github.com/rwhogg/bobs-git-utils"
  url "https://github.com/rwhogg/bobs-git-utils/archive/v0.12.zip"
  sha256 "37ac86eb7c5775be26c363bd5a58343f03c7ca35cdd4d259ced29a5e1c4e75e0"

  depends_on "git-extras"
  depends_on "moz-git-tools"
  depends_on "scdoc" => :build

  def install
    inreplace "Makefile", "prefix=/usr/local", "prefix=#{prefix}"
    system "make", "docs"
    system "make", "install"
  end

  test do
    system "false"
  end
end
