require 'chefspec'

describe 'package::reconfig' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'reconfigs a package with an explicit action' do
    expect(chef_run).to reconfig_package('explicit_action')
    expect(chef_run).to_not reconfig_package('not_explicit_action')
  end

  it 'reconfigs a package with attributes' do
    expect(chef_run).to reconfig_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not reconfig_package('with_attributes').with(version: '1.2.3')
  end

  it 'reconfigs a package when specifying the identity attribute' do
    expect(chef_run).to reconfig_package('identity_attribute')
  end
end
