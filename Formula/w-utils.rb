class WUtils < Formula
  desc "Unix command-line tools rewritten in Rust (wcp: cp with a progress bar)"
  homepage "https://github.com/Miro-sh/w-utils"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Miro-sh/w-utils/releases/download/v0.1.7/w-utils-aarch64-apple-darwin.tar.gz"
      sha256 "03961af8c46ceea18c353e1dfcc3d4b2ee5ea236b2dcf4fca8efb56284fd11ee"
    else
      url "https://github.com/Miro-sh/w-utils/releases/download/v0.1.7/w-utils-x86_64-apple-darwin.tar.gz"
      sha256 "fcff482ad17e081692bb15d6627af5ed54addd5a674f96db84fef837482cf012"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Miro-sh/w-utils/releases/download/v0.1.7/w-utils-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e917ea1f3f1d7d3c28053549095feea171b31fc780335b7ed201e5d87558926"
    else
      url "https://github.com/Miro-sh/w-utils/releases/download/v0.1.7/w-utils-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7b4842db144874544371d666c2a3178955cf3d2f23320683b9fd9da47d8d24df"
    end
  end

  def install
    bin.install "wcp"
    man1.install "wcp.1.gz" if File.exist? "wcp.1.gz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wcp --version")
  end
end
