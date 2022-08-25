require_relative '../init'

ENV['BOOTSTRAP'] ||= 'on'

if ENV['BOOTSTRAP'] == 'on'
  require 'test_bench/bootstrap'; TestBench::Bootstrap.activate
else
  TestBench.activate
end

require 'test_bench/source_path/controls'

#SourcePath = TestBench::SourcePath
#Controls = TestBench::SourcePath::Controls
