#
# Cookbook Name:: ruby
# Library:: ruby_installer
#

require_relative 'ruby_installer/base'
require_relative 'ruby_installer/ruby_build'

module RubyInstaller
  class << self
    def new(resource)
      strategy_class(resource.strategy).new(resource)
    end

    private

    def strategy_class(strategy)
      RubyInstaller.const_get(strategy.to_s.split('_').collect(&:capitalize).join)
    end
  end
end
