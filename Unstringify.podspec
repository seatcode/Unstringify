Pod::Spec.new do |s|
  s.name     = 'Unstringify'
  s.version  = '0.3.1'
  s.summary  = 'Code generator for strong-typing localizable strings.'
  s.homepage = 'https://github.com/metrolab/Unstringify'
  s.license  = 'MIT'
  s.author   = { 'metrolab' => 'hello@metropolis-lab.io' }
  s.source   = { :http => "https://github.com/metrolab/Unstringify/releases/download/#{s.version}/unstringify-#{s.version}.zip" }

  s.preserve_paths = '*'
  s.exclude_files  = '**/file.zip'
end

