require 'serverspec'

set :backend, :exec

describe 'versions' do
  it 'installs 2.2.3' do
    expect(command('/opt/rubies/2.2.3/bin/ruby -v').stdout).to match /2.2.3/
  end

  it 'installs 2.1.7' do
    expect(command('/opt/rubies/2.1.7/bin/ruby -v').stdout).to match /2.1.7/
  end

  it 'installs 2.0.0-p647' do
    expect(command('/opt/rubies/2.0.0-p647/bin/ruby -v').stdout).to match /2.0.0p647/
  end
end
