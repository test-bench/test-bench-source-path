module TestBench
  class SourcePath
    module Controls
      module Path
        def self.example
          Relative.example
        end

        def self.filename
          'some_file.rb'
        end

        module Relative
          def self.example(*path_fragments)
            if path_fragments.empty?
              path_fragments = ['some-dir', Path.filename]
            end

            File.join(*path_fragments)
          end

          module Gem
            def self.example
              rubygems_ruby_version = TestBench::SourcePath::Pattern::Gem.rubygems_ruby_version

              filename = Path.filename

              Relative.example('gems', 'ruby', rubygems_ruby_version, 'gems', 'some_gem-1.0.0', 'lib', 'some_gem', filename)
            end
          end
        end

        module Absolute
          def self.example(*path_fragments)
            if path_fragments.empty?
              path_fragments = ['some-toplevel-dir', Path.filename]
            end

            root = Directory.root

            File.join(root, *path_fragments)
          end

          module Gem
            def self.example
              relative_path = Relative::Gem.example

              Absolute.example(relative_path)
            end
          end
        end
      end
    end
  end
end
