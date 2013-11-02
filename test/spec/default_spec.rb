require 'spec_helper'

describe 'property_file_test::default' do

  context 'create' do

    let(:chef_run) do
      ChefSpec::Runner.new(step_into: ['property_file']).converge(described_recipe)
    end

    it 'creates the app user' do
      expect(chef_run).to create_user('test_user')
    end

    it 'creates the app directory' do
      expect(chef_run).to create_directory('/usr/share/property_file/app').with(user: 'test_user')
    end

    it 'creates a property file' do
      expect(chef_run).to create_template('/usr/share/property_file/app/properties.yml')
    end

  end

end
