require 'serverspec'

set :backend, :exec

describe 'versions' do
  let(:versions) { ['2.2.3', '2.1.7', '2.0.0-p647'] }

  it "installs versions" do
    versions.each do |version|
      expect(command("/opt/rubies/#{version}/bin/ruby -v").stdout).to match /#{version.gsub('-', '')}/
    end
  end

  it "installs bundler gem" do
    versions.each do |version|
      expect(command("/opt/rubies/#{version}/bin/bundler -v").stdout).to match /Bundler version/
    end
  end
end
