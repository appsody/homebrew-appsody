class Appsody < Formula
  desc "The Appsody command-line interface"
  homepage "https://www.appsody.dev"
  url "https://github.com/appsody/appsody/releases/download/0.2.7/appsody-homebrew-0.2.7.tar.gz"
  # version "0.2.7"
  sha256 "bd0e337305540b08d7bd1c028a90b52136b4698318fe3b66ab789f469e3e47fc"

  def install
    bin.install "appsody"
    bin.install "appsody-controller"
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