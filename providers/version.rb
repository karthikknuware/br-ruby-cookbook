#
# Cookbook Name:: br-ruby
# Provider:: version
#

provides :ruby_version

use_inline_resources

def whyrun_supported?
  true
end

def runtime
  @runtime ||= BR::Ruby::Runtime.new(install_path: new_resource.install_path,
    version: new_resource.version, gems: new_resource.gems)
end

action :install do
  directory new_resource.install_path do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    recursive true
  end

  runtime.install! do |runtime|
    execute runtime.install_command do
      environment new_resource.env
    end
  end

  runtime.gems.each do |gem|
    execute gem.install_command do
      environment new_resource.env
    end
  end
end

action :uninstall do
  runtime.uninstall! do |runtime|
    directory runtime.root do
      recursive true
      action :delete
    end
  end
end
