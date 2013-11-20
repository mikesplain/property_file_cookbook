Property_file cookbook [![Build Status](https://travis-ci.org/mikesplain/property_file_cookbook.png)](https://travis-ci.org/mikesplain/property_file_cookbook)
================================================


The goal of the Property_file cookbook is to create a property file based on different parameters passed in the Property_file resource, via data_bag files. 


Requirements
================================================
There are no real requirements for Property_file unless you want to test (which would require rake and other gems located in Gemfile)

Usage
================================================
You can see sample usage in the test cookbook attached but it looks basically like this:

```ruby
property_file node[:property_file_test][:properties] do
  env node[:property_file_test][:env]

  app_group 'my_application_group'
  app 'my_awesome_application'
  instance 'instance01'

  owner 'test_user'
  group 'test_user'

  mode 0755
  service 'jetty'
end
```

