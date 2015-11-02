#
# Cookbook Name:: ruby
# Recipe:: clean
#

if ::File.exist?(node['ruby']['install_path'])
  directories = Dir.glob(::File.join(node['ruby']['install_path'], "*#{::File::Separator}"))

  directories.each do |path|
    version = path.split('/').last

    directory path do
      recursive true
      action :delete
      not_if { node['ruby']['installed_versions'].include? version }
    end
  end
end
