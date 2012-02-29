Gem::Specification.new do |s|
  s.name        = 'rack-replace-http-accept'
  s.version     = '0.0.2'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Tom Maguire']
  s.email       = ['tom.d.maguire@gmail.com']
  s.summary     = 'Rack adapter used to modify HTTP Accept header'
  s.description = ""
  s.homepage    = 'http://github.com/tomglue/rack-replace-http-accept'

  s.files         = `git ls-files`.split("\n") - ['Gemfile.lock']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rack'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rack-test'
end
