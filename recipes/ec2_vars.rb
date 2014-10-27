if node[:ec2]
  prefix = node['app']['name']
  node.set['app']['ssl']['cert'] = citadel["#{prefix}/internal_cert"]
  node.set['app']['ssl']['key'] = citadel["#{prefix}/internal_cert_key"]
end
