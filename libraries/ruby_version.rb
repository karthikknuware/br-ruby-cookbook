module Libraries
  class RubyVersion

    attr_reader :root, :version

    def initialize(root: nil, version: nil)
      @root = root
      @version = version
    end

    def install!
      if ::File.exist?(exec)
        print "Ruby #{version} is already installed"
      else
        print "Installing Ruby #{version}..."
        yield self
      end
    end

    def uninstall!
      if ::File.exist?(path)
        print "Uninstalling Ruby #{version}..."
        yield self
      else
        print "Ruby #{version} is not installed"
      end
    end

    def install_command
      "ruby-build #{version} #{path}"
    end

    def exec
      ::File.join(path, 'bin', 'ruby')
    end

    def path
      ::File.join(root, version)
    end

    def print(message)
      puts "\n[ruby] #{message}"
    end

  end
end
