#
# Cookbook Name:: ruby
# Provider:: version
#

use_inline_resources

def whyrun_supported?
  true
end

action :install do
  build_path = ::File.join(new_resource.install_path, new_resource.version)
  ruby_exec = ::File.join(build_path, 'bin', 'ruby')
  global_exec = ::File.join(new_resource.global_bin_path, 'ruby')

  if ::File.exist?(ruby_exec)
    print "Ruby #{new_resource.version} is already installed."
  else
    print "Installing Ruby #{new_resource.version}..."

    execute "ruby-build #{new_resource.version} #{build_path}"

    link global_exec do
      to ruby_exec
      only_if { new_resource.globalize }
    end
  end
end

action :uninstall do

end

def print(message)
  puts "\n[ruby] #{message}"
end
