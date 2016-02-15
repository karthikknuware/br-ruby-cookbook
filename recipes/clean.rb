#
# Cookbook Name:: br-ruby
# Recipe:: clean
#

if ::File.exist?(node['ruby']['install_path'])
  directories = Dir.glob(::File.join(node['ruby']['install_path'], "*#{::File::Separator}"))
  installed_versions = directories.map { |path| path.split('/').last }
  versions_to_remove = installed_versions - node['ruby']['versions']

  versions_to_remove.each do |version|
    ruby_version version do
      path node['ruby']['install_path']
      action :uninstall
    end
  end
end
