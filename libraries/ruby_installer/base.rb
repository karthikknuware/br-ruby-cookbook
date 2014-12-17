module RubyInstaller
  class Base

    attr_accessor :resource, :config

    def initialize(resource)
      self.resource = resource
      self.config = resource.config
    end

    def type
      resource.strategy.to_s
    end

    def ruby_engine
      'ruby'
    end

    def ruby_version
      resource.version
    end

    def ruby_path
      ::File.join(install_path, "ruby-#{ruby_version}")
    end

    def gem_home
      gem_exec = ::File.join(ruby_installer.ruby_path, 'bin', 'gem')
      gem_env_gemdir_command = Mixlib::ShellOut.new("#{gem_exec} env gemdir")
      gem_env_gemdir_command.run_command
      gem_env_gemdir_command.stdout.chomp
    end

    def gem_path
      gem_home
    end

    def install_path
      resource.path
    end

    def path
      ::File.join(Chef::Config['file_cache_path'], type)
    end

    def ruby_bin_path
      ::File.join(ruby_installer.ruby_path, 'bin')
    end

    def path_with_ruby
      "#{ruby_bin_path}:#{ENV['PATH']}" unless ENV['PATH'].include? ruby_bin_path
    end

    def already_installed?
      ::File.exists?(::File.join(ruby_path, 'bin', 'ruby'))
    end

    def install?
      resource.force || !already_installed?
    end

  end
end
