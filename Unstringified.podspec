Pod::Spec.new do |s|
  s.name     = 'Unstringified'
  s.version  = '0.3.2'
  s.summary  = 'Strong-typed localizable strings static  code.'
  s.homepage = 'https://github.com/metrolab/Unstringify'
  s.license  = 'MIT'
  s.author   = { 'metrolab' => 'hello@metropolis-lab.io' }
  s.source   = { :git => 'https://github.com/metrolab/Unstringify.git', :tag => s.version.to_s }

  s.source_files = 'Sources/Unstringified/**/*.swift'

  s.ios.deployment_target     = '11.0'
  s.osx.deployment_target     = '10.13'
  s.tvos.deployment_target    = '11.0'
  s.watchos.deployment_target = '4.0'

  s.swift_versions = ['5.0', '5.1']
end

