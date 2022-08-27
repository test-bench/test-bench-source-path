module TestBench
  class SourcePath
    module Controls
      module Directory
        def self.example
          Dir.tmpdir
        end

        def self.current
          ::Dir.pwd
        end

        def self.root
          dir = example

          loop do
            dirname = File.dirname(dir)
            break if dirname == dir

            dir = dirname
          end

          dir
        end

        module Relative
          def self.example(*path_fragments)
            if path_fragments.empty?
              path_fragments = ['some-dir']
            end

            File.join(*path_fragments)
          end
        end

        module Absolute
          def self.example(*path_fragments)
            if path_fragments.empty?
              path_fragments = [Directory.example]
            end

            root = Directory.root

            File.join(root, *path_fragments)
          end
        end
      end
    end
  end
end
