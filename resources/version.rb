#
# Cookbook Name:: ruby
# Resource:: version
#

actions :install, :uninstall
default_action :install

attribute :version, kind_of: String, name_attribute: true, required: true
attribute :install_path, kind_of: String, default: '/opt/rubies'
attribute :global_bin_path, kind_of: String, default: '/usr/local/bin'
attribute :build_env, kind_of: Hash, default: {}
attribute :owner, kind_of: String, default: 'root'
attribute :group, kind_of: String, default: 'root'
attribute :mode, kind_of: String, default: '0755'
attribute :globalize, kind_of: [TrueClass, FalseClass], default: false
