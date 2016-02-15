#
# Cookbook Name:: br-ruby
# Library:: runtime
#

module BR
  module Ruby
    class Runtime

      attr_reader :root, :version, :gems

      def initialize(install_path: nil, version: nil, gems: {})
        @root = ::File.join(install_path, version)
        @version = version
        @gems = Gem.build(self, gems)
      end

      def install!
        if ::File.exist?(executable)
          print "Ruby #{version} is already installed"
        else
          print "Installing Ruby #{version}..."
          yield self
        end
      end

      def uninstall!
        if ::File.exist?(root)
          print "Uninstalling Ruby #{version}..."
          yield self
        else
          print "Ruby #{version} is not installed"
        end
      end

      def install_command
        "ruby-build #{version} #{root}"
      end

      def executable
        ::File.join(root, 'bin', 'ruby')
      end

      def bin_path
        ::File.join(root, 'bin')
      end

      def print(message)
        puts "\n[ruby] #{message}"
      end

    end
  end
end
