class Jpeg < Formula
  desc "Image manipulation library"
  homepage "https://www.ijg.org/"
  url "https://www.ijg.org/files/jpegsrc.v8d.tar.gz"
  sha256 "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3"

  bottle do
    cellar :any
    sha256 "1daa0fc0c197d96dd4e1afddb9ad576951a15aafd6b85138b8a60817d1d8173c" => :mojave
    sha256 "178200fd8aa50d5db22c5faa4ca403652d2bf912616c34dfbc6b035a456c2fc6" => :high_sierra
    sha256 "8ecc3407d188472a7f775bb44314fff40f0e3b17a83da1666f3fa306d8fffeec" => :sierra
    sha256 "931236302e58c53a9728dde5cb93a896b8a39b16d1f195c85381da04ea17c407" => :el_capitan
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/djpeg", test_fixtures("test.jpg")
  end
end