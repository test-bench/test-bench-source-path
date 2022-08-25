# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'test_bench-path'
  s.version = '0'

  s.authors = ['Nathan Ladd']
  s.email = 'nathanladd+github@gmail.com'
  s.homepage = 'https://github.com/test-bench/test-bench-output'
  s.licenses = %w(MIT)
  s.summary = "Path utility for TestBench, a principled Test Framework for Ruby"
  s.platform = Gem::Platform::RUBY

  s.require_paths = %w(lib)
  s.files = Dir.glob 'lib/**/*'

  s.add_development_dependency 'test_bench-bootstrap', '~> 3.0.0'
end
