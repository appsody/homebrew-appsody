class Appsody < Formula
  desc "The Appsody command-line interface"
  homepage "https://www.appsody.dev"
  url "https://github.com/appsody/appsody/releases/download/0.5.0/appsody-homebrew-0.5.0.tar.gz"
  # version "0.5.0"
  sha256 "9df6551f452919199bcb6c3648ed55d1c21111245ac54d672a5a392c6a19e7fa"

  def install
    bin.install "appsody"
    ohai "Checking prerequisites..."
    retval=check_prereqs
    if retval
      ohai "Done."
    else
      opoo "Docker not detected. Please ensure docker is installed and running before using appsody."
    end
  end

  def check_prereqs
    begin
      original_stderr = $stderr.clone
      original_stdout = $stdout.clone
      $stderr.reopen(File.new("/dev/null", "w"))
      $stdout.reopen(File.new("/dev/null", "w"))
      begin
        system("/usr/local/bin/docker", "ps")
        retval=true
      rescue
        retval=false
      end
    rescue => e
      $stdout.reopen(original_stdout)
      $stderr.reopen(original_stderr)
      raise e
    ensure
      $stdout.reopen(original_stdout)
      $stderr.reopen(original_stderr)
    end
    retval
  end

  test do
    raise "Test not implemented."
  end
end
