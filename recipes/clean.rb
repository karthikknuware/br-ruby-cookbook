#
# Cookbook Name:: br_ruby
# Recipe:: clean
#

if ::File.exist?(node['ruby']['path'])
  directories = Dir.glob(::File.join(node['ruby']['path'], "*#{::File::Separator}"))
  previous_versions = directories.map { |path| path.split('/').last }
  versions_to_remove = previous_versions - node['ruby']['versions']

  versions_to_remove.each do |version|
    ruby_version version do
      path node['ruby']['path']
      action :uninstall
    end
  end
end
