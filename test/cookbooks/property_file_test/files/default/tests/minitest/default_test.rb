require 'minitest/spec'


describe_recipe 'property_file_test::default' do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources


  it 'creates the config file user' do
    user('test_user').must_exist
  end

  it 'creates the property file directory' do
    directory('/usr/share/property_file/app')
      .must_exist
      .with(:owner, 'test_user')
      .with(:group, 'test_user')
      .with(:mode, 0755)
  end

  it 'creates the property file' do
    file('/usr/share/property_file/app/properties.yml')
      .must_exist
      .with(:owner, 'test_user')
      .with(:group, 'test_user')
      .with(:mode, 0755)
  end

  describe 'property file' do
    let(:config) { file('/usr/share/property_file/app/properties.yml') }

    it { config.must_include 'Note: This file is managed by Chef property_file and local changes will be overwritten' }

    it { config.must_include 'a=aaaa' }

    it { config.must_include 'b=bbbb' }

    it { config.must_include 'aa=sdfdf' }

    it { config.must_include 'e=zzz' }

    it { config.must_include 'Apps=' }
    
    it { config.must_include '  Name=a' }

    it { config.must_include '  property=b' }
    
  end

end
