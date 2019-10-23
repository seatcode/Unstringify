Pod::Spec.new do |s|
    s.name             = 'Commons'
    s.version          = '1.0'
    s.summary          = s.name.to_s
    s.homepage         = 'https://github.com/metrolab/Unstringify'
    s.license          = 'MIT'
    s.author           = 'Metropolis:Lab'
    s.source           = { :path => '.' }

    s.resource_bundles = {
        'Commons' => ['Resources/*.lproj/*.strings']
    }

    s.source_files = ['Resources/*.swift']

    s.dependency 'Unstringified'

    s.ios.deployment_target = "13.0"
end
