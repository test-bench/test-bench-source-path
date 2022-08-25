require_relative './test_init'

if TestBench.const_defined?(:Bootstrap)
  TestBench::Bootstrap::Run.()
else
  TestBench::CLI.()
end
