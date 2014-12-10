name "mirage"
maintainer "General Services Administration - 18F"
maintainer_email "devops@gsa.gov"
description "Install Mirage market research tool"
version "0.0.2"
license "CC0"


depends 'postgresql', '~> 3.4.4'
depends 'database'
depends 'python'
depends 'nginx'
depends 'nginx_conf'
depends 'user'
depends 'citadel'
depends 'shipper', '~> 0.1.0'
