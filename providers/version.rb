#
# Cookbook Name:: br-ruby
# Provider:: version
#

provides :ruby_version

use_inline_resources

def whyrun_supported?
  true
end

def ruby_version
  @ruby_version ||= Libraries::RubyVersion.new(root: new_resource.path,
    version: new_resource.version, gems: new_resource.gems)
end

action :install do
  directory new_resource.path do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    recursive true
  end

  ruby_version.install! do |ruby_version|
    execute ruby_version.install_command do
      environment new_resource.env
    end
  end

  ruby_version.gems.each do |ruby_gem|
    execute ruby_gem.install_command do
      environment new_resource.env
    end
  end
end

action :uninstall do
  ruby_version.uninstall! do |ruby_version|
    directory ruby_version.path do
      recursive true
      action :delete
    end
  end
end
