#
# Cookbook Name:: br-ruby
# Resource:: version
#

resource_name :ruby_version

actions :install, :uninstall
default_action :install

attribute :version, kind_of: String, name_attribute: true, required: true
attribute :path, kind_of: String, default: '/opt/rubies'
attribute :env, kind_of: Hash, default: {}
attribute :gems, kind_of: Hash, default: {}
attribute :owner, kind_of: String, default: 'root'
attribute :group, kind_of: String, default: 'root'
attribute :mode, kind_of: String, default: '0755'
