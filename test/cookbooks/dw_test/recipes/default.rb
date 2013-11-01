property_file node[:propertyman_test][:properties] do
  env node[:propertyman_test][:env]

  app_group "my_application_group"
  app "my_awesome_application"
  instance "instance01"

  owner "deploy"
  group "deploy"

  mode 0755
end

