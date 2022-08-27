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
        end

        module Absolute
          def self.example(*path_fragments)
            if path_fragments.empty?
              path_fragments = ['some-toplevel-dir', Path.filename]
            end

            root = Directory.root

            File.join(root, *path_fragments)
          end
        end
      end
    end
  end
end
