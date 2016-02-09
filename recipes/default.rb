#
# Cookbook Name:: br_ruby
# Recipe:: default
#

include_recipe 'br_ruby::prepare'
include_recipe 'br_ruby::install'
include_recipe 'br_ruby::clean'
