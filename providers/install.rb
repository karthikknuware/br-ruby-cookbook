#
# Cookbook Name:: ruby
# Provider:: install
#

use_inline_resources if defined?(:use_inline_resources)

def whyrun_supported?
  true
end

action :install do
  if ruby_installer.install?
    pre_install
    install_packages
    setup_installer
    install_ruby
    set_environment
    post_install

    new_resource.updated_by_last_action(true)
  end
end

def ruby_installer
  @ruby_installer ||= RubyInstaller.new(new_resource)
end

def pre_install
  new_resource.before.each do |before_hook|
    execute before_hook do
      command before_hook
    end
  end
end

def post_install
  new_resource.after.each do |after_hook|
    execute after_hook do
      command after_hook
    end
  end
end

def install_packages
  new_resource.packages.each do |name|
    package name
  end
end

def setup_installer
  case ruby_installer.source_type
  when :git
    git ruby_installer.path do
      repository ruby_installer.config['repository']
      revision ruby_installer.config['revision']
      action ruby_installer.config['upgrade'] ? :sync : :checkout
    end
  end

  execute ruby_installer.setup_command do
    cwd ruby_installer.path

    only_if do
      ruby_installer.config['upgrade'] || !ruby_installer.setup?
    end
  end
end

def install_ruby
  directory ::File.dirname(ruby_installer.ruby_path) do
    recursive true
  end

  execute "install_ruby_#{ruby_installer.ruby_version}" do
    command ruby_installer.install_command
    user new_resource.user
    group new_resource.group
    environment new_resource.environment
  end
end

def set_environment
  ruby_block 'set_environment' do
    block do
      ENV['RUBY_ENGINE'] = ruby_installer.ruby_engine
      ENV['RUBY_VERSION'] = ruby_installer.ruby_version
      ENV['RUBY_ROOT'] = ruby_installer.ruby_path
      ENV['GEM_HOME'] = ruby_installer.gem_home
      ENV['GEM_PATH'] = ruby_installer.gem_path
      ENV['PATH'] = ruby_installer.path_with_ruby
    end
  end

  ohai 'reload_ruby' do
    plugin 'languages/ruby'
    action :reload
  end
end
