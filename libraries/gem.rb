#
# Cookbook Name:: br-ruby
# Library:: gem
#

module BR
  module Ruby
    class Gem

      attr_reader :runtime, :name, :version

      def self.build(runtime, attributes)
        attributes.map do |name, version|
          new(runtime, name, version)
        end
      end

      def initialize(runtime, name, version)
        @runtime = runtime
        @name = name
        @version = version
      end

      def executable
        ::File.join(runtime.bin_path, 'gem')
      end

      def install_command
        "#{executable} install #{name} --version=\"#{version}\""
      end

    end
  end
end
