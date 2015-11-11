require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start!

RSpec.configure do |config|
  config.color = true
  config.log_level = :debug
  config.platform = 'ubuntu'
  config.version = '14.04'
end
