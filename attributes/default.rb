#
# Cookbook Name:: ruby
# Attributes:: default
#

default['ruby']['version'] = nil
default['ruby']['path'] = '/opt/rubies'

default['ruby']['install']['user'] = 'root'
default['ruby']['install']['group'] = 'root'
default['ruby']['install']['force'] = false
default['ruby']['install']['environment'] = {}
default['ruby']['install']['strategy'] = :ruby_build
default['ruby']['install']['before'] = []
default['ruby']['install']['after'] = []

default['ruby']['install']['ruby_build'].tap do |ruby_build|
  ruby_build['repository'] = 'https://github.com/sstephenson/ruby-build.git'
  ruby_build['revision'] = 'master'
  ruby_build['upgrade'] = false
end

case platform_family
when 'arch'
  default['ruby']['packages'] = []
when 'debian'
  default['ruby']['packages'] = %w( tar bash curl git-core build-essential bison openssl 
                                    libreadline6 libreadline6-dev zlib1g zlib1g-dev 
                                    libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev 
                                    sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev 
                                    ssl-cert subversion make g++ )

when 'mac_os_x'
  default['ruby']['packages'] = []
when 'rhel' 
  default['ruby']['packages'] = []
when 'suse' 
  default['ruby']['packages'] = []
end
