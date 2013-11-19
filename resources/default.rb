#
# Author:: Mike Splain(<msplain@paypal.com>)
# Cookbook Name:: property_file
# Resource:: default

actions :create, :delete
default_action :create

def initialize(*args)
  super
  @action = :create
end


attribute :name,          kind_of: String, default: nil,  required: true, name_attribute: true
attribute :env,          kind_of: String, default: nil, required: true

attribute :app_group,      kind_of: String, default: nil
attribute :app,   kind_of: String, default: ''
attribute :instance,      kind_of: String, default: nil

attribute :owner,          kind_of: String, default: nil
attribute :group,         kind_of: String, default: nil
attribute :mode,         kind_of: Integer, default: nil

attribute :bag,          kind_of: String, default: 'property_files'

attribute :template_pre_key,  kind_of: String, default: nil
attribute :template_post_key, kind_of: String, default: nil
attribute :template_separator, kind_of: String, default: '='
attribute :template_pre_value, kind_of: String, default: nil
attribute :template_post_value, kind_of: String, default: nil

attribute :template_separator_before_sub, kind_of: String, default: '='
attribute :template_sub_indent, kind_of: String, default: "  "

attribute :template_path, kind_of: String, default: 'properties.erb'
attribute :template_cookbook, kind_of: String, default: 'property_file'

