require 'spec_helper'

describe 'property_file_test::default' do

  context 'create' do

    let(:chef_run) do
      ChefSpec::Runner.new(step_into: ['property_file']).converge(described_recipe)
    end

    before do
      stub_data_bag_item("property_files", "my_application_group").and_return({"id" => "my_application_group","properties" => {"a" => "aaaa","b" => "bbbb","aa" => "sdfdf","Apps" => {"Name" => "a","property" => "bbc"}}})
      stub_data_bag_item("property_files", "my_application_group_my_awesome_application").and_return({"id" => "my_application_group_my_awesome_application","properties" => {"a" => "bbb","b" => "ccc","e" => "zzz"}})
      stub_data_bag_item("property_files", "my_application_group_my_awesome_application_instance01").and_return({"id" => "my_application_group_my_awesome_application_instance01","properties" => {"a" => "aaaa","b" => "bbbb"}})
      stub_command("test -e /home/test_user").and_return(false)
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
