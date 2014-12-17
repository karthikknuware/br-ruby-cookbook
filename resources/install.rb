#
# Cookbook Name:: ruby
# Resource:: install
#

actions :install
default_action :install

attribute :version, kind_of: String, name_attribute: true, required: true
attribute :packages, kind_of: Array, default: []
attribute :path, kind_of: String, default: '/usr/local/ruby'
attribute :user, kind_of: String, default: 'root'
attribute :group, kind_of: String, default: 'root'
attribute :force, kind_of: [TrueClass, FalseClass], default: false
attribute :environment, kind_of: Hash, default: {}
attribute :strategy, kind_of: [String, Symbol], default: :ruby_build
attribute :config, kind_of: Hash
attribute :before, kind_of: Array, default: []
attribute :after, kind_of: Array, default: []
