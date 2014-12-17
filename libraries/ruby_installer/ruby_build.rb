module RubyInstaller
  class RubyBuild < Base

    def source_type
      :git
    end

    def setup?
      ::File.exists?('/usr/local/bin/ruby-build')
    end

    def setup_command
      './install.sh'
    end

    def install_command
      "ruby-build #{ruby_version} #{ruby_path}"
    end

  end
end
