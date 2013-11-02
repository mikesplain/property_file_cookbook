property_file node[:property_file_test][:properties].to_s do
  env node[:property_file_test][:env]

  app_group "my_application_group"
  app "my_awesome_application"
  instance "instance01"

  owner "test_user"
  group "test_group"

  mode 0755
end

