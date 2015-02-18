Gem::Specification.new do |s|
  s.name = 'sps-ftpd-driver'
  s.version = '0.2.0'
  s.summary = 'Uses the ftpd gem to publish a SimplePubSub notice whenever a file is uploaded.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_runtime_dependency('ftpd', '~> 1.1', '>=1.1.1')  
  s.add_runtime_dependency('sps-pub', '~> 0.4', '>=0.4.0')
  s.add_runtime_dependency('chronic_between', '~> 0.2', '>=0.2.21')
  s.signing_key = '../privatekeys/sps-ftpd-driver.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/sps-ftpd-driver'
end
