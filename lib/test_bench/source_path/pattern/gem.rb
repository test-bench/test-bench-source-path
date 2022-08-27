module TestBench
  class SourcePath
    class Pattern
      module Gem
        def self.instance
          @instance ||= build
        end

        def self.build
          Pattern.new(pattern)
        end

        def self.pattern
          File.join('**', 'gems', 'ruby', rubygems_ruby_version, '**', '*')
        end

        def self.rubygems_ruby_version
          RbConfig::CONFIG['ruby_version']
        end
      end
    end
  end
end
