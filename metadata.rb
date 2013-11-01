name             'propertyman'
maintainer       'Mike Splain'
maintainer_email 'msplain@paypal.com'
license          'Apache 2.0'
description      'LWRP for creating property and configuration files from data bags'
version          '0.0.1'



%w{ ubuntu centos }.each do |os|
  supports os
end
