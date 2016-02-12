module Libraries
  class RubyGem

    attr_reader :ruby_version, :name, :version

    def initialize(ruby_version, name, version)
      @ruby_version = ruby_version
      @name = name
      @version = version
    end

    def install_command
      executable = ::File.join(ruby_version.bin_path, 'gem')
      "#{executable} install #{name} --version=\"#{version}\""
    end

  end
end
