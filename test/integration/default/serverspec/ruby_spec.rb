require 'serverspec'

set :backend, :exec

describe 'ruby' do
  let(:versions) { ['2.2.3', '2.1.7'] }
  let(:gems) { ['bundler'] }

  it "installs versions" do
    versions.each do |version|
      expect(command("/opt/rubies/#{version}/bin/ruby -v").stdout).to match /#{version.gsub('-', '')}/
    end
  end

  it "installs gems" do
    versions.each do |version|
      gems.each do |name|
        expect(command("/opt/rubies/#{version}/bin/#{name} -v").stdout).to match /#{name}/i
      end
    end
  end
end
