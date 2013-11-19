#
# Author:: Mike Splain(<msplain@paypal.com>)
# Cookbook Name:: property_file
# Resource:: default

def whyrun_supported?
  true
end

def check_resource(resource)
  if resource.nil? || resource.name.nil? || resource.env.nil?
    Chef::Application.fatal!('You must provide a file path and env.')
  end
end


action :create do

  check_resource(new_resource)

  app_group_attributes = data_bag_item(new_resource.bag, new_resource.app_group)['properties']
  app_attributes = data_bag_item(new_resource.bag, "#{new_resource.app_group}_#{new_resource.app}")['properties']
  instance_attributes = data_bag_item(new_resource.bag, "#{new_resource.app_group}_#{new_resource.app}_#{new_resource.instance}")['properties']

  converge_by 'Check if user already exists' do
    user "#{new_resource.owner}" do
      home "/home/#{new_resource.owner}"
      not_if "test -e /home/#{new_resource.owner}"
    end
  end

  converge_by 'Check to make sure template folder still exists' do
    directory '/' + new_resource.name.split('/')[1..-2].join('/') do
      owner new_resource.owner
      group new_resource.group
      mode new_resource.mode
      recursive true
    end
  end

  attributes = app_group_attributes.merge!(app_attributes)
  attributes = attributes.merge!(instance_attributes)

  template new_resource.name do
    source new_resource.template_path
    cookbook new_resource.template_cookbook

    mode new_resource.mode
    owner new_resource.owner
    group new_resource.group

    variables(
      attributes: attributes,
      new_resource: new_resource
    )

    notifies :restart, "service#{new_resource.service}" if new_resource.service

  end

new_resource.updated_by_last_action(true)
end





