# -*- encoding: utf-8 -*-
$: << File.expand_path("../lib", __FILE__)
require "apartment/version"

Gem::Specification.new do |s|
  s.name = %q{apartment}
  s.version = Apartment::VERSION

  s.authors       = ["Ryan Brunner", "Brad Robertson"]
  s.summary       = %q{A Ruby gem for managing database multitenancy}
  s.description   = %q{Apartment allows Rack applications to deal with database multitenancy through ActiveRecord}
  s.email         = ["ryan@influitive.com", "brad@influitive.com"]
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.homepage = %q{https://github.com/influitive/apartment}
  s.licenses = ["MIT"]

  s.add_dependency 'activerecord',    '>= 5.2.0'
  s.add_dependency 'rack',            '>= 1.3.6'
  s.add_dependency 'public_suffix',   '>= 2.0.5'
  s.add_dependency 'parallel',        '>= 0.7.1'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'rake',         '~> 0.9'
  s.add_development_dependency 'capybara',     '~> 2.0'

  if defined?(JRUBY_VERSION)
    s.add_development_dependency 'activerecord-jdbc-adapter'
    s.add_development_dependency 'activerecord-jdbcpostgresql-adapter'
    s.add_development_dependency 'activerecord-jdbcmysql-adapter'
    s.add_development_dependency 'jdbc-postgres', '9.2.1002'
    s.add_development_dependency 'jdbc-mysql'
    s.add_development_dependency 'jruby-openssl'
  else
    s.add_development_dependency 'mysql2', '~> 0.3.10'
    s.add_development_dependency 'pg',     '>= 0.11.0'
    s.add_development_dependency 'sqlite3'
  end
end
