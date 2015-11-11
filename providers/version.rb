#
# Cookbook Name:: ruby
# Provider:: version
#

use_inline_resources

def whyrun_supported?
  true
end

def ruby_version
  @ruby_version ||= Libraries::RubyVersion.new(root: new_resource.path, version: new_resource.version)
end

action :install do
  ruby_version.install! do |ruby_version|
    execute ruby_version.install_command do
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


