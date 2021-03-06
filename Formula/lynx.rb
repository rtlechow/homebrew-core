class Lynx < Formula
  desc "Text-based web browser"
  homepage "https://invisible-island.net/lynx/"
  url "https://invisible-mirror.net/archives/lynx/tarballs/lynx2.8.8rel.2.tar.bz2"
  version "2.8.8rel.2"
  sha256 "6980e75cf0d677fd52c116e2e0dfd3884e360970c88c8356a114338500d5bee7"
  revision 1

  bottle do
    rebuild 1
    sha256 "979236f9bc2b53908e398e1faa452da5cfad2677b99e64d8bd5a5de7d5d1c86a" => :high_sierra
    sha256 "bea7cf10aa6df403d9c421ef1e91d7af9b07bb2c2c41b71a36e975ca6d4b9bc2" => :sierra
    sha256 "1b0f14f892c930a2140a853edd308edc7545b0e2baa1637e77b925209476fe96" => :el_capitan
    sha256 "41ddd45e917af411f20cebf679459490cb412a1f94b662a7f1e9f8cc9f9f394f" => :mavericks
    sha256 "a12c691f38002046a7a71c84df76f0f70e95c92a879663e50793dde1611c4834" => :mountain_lion
    sha256 "8ae76d02829b7d9d0daf1a43d57ef765e9bbc0002511ae71fc977262df3f652d" => :lion
  end

  depends_on "openssl"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--disable-echo",
                          "--enable-default-colors",
                          "--with-zlib",
                          "--with-bzlib",
                          "--with-ssl=#{Formula["openssl"].opt_prefix}",
                          "--enable-ipv6"
    system "make", "install"
  end

  test do
    system "#{bin}/lynx", "-dump", "https://example.org/"
  end
end
