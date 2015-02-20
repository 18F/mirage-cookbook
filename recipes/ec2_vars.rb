if node['ec2']
  prefix = node['app']['name'] + '/' + node['app']['environment']
  node.set['app']['ssl']['cert'] = citadel["#{prefix}/internal_cert"]
  node.set['app']['ssl']['key'] = citadel["#{prefix}/internal_cert_key"]
  node.set['app']['s3']['access_key_id'] = citadel["#{prefix}/s3_access_key"].strip
  node.set['app']['s3']['secret_access_key'] = citadel["#{prefix}/s3_secret"].strip
  node.set['app']['sam_api_key'] = citadel["#{prefix}/sam_api_key"].strip
  node.set['app']['api_key'] = citadel["#{prefix}/api_key"].strip
  node.set['app']['api_host'] = citadel["#{prefix}/api_host"].strip
end
