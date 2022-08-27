module TestBench
  class SourcePath
    attr_reader :path
    attr_reader :base_dir

    def gem_pattern
      @gem_pattern ||= Pattern::Gem.instance
    end
    attr_writer :gem_pattern

    def initialize(path, base_dir)
      @path = path
      @base_dir = base_dir
    end

    def self.build(path_fragment, *path_fragments, base_dir: nil)
      base_dir ||= Defaults.base_dir

      path = canonize(path_fragment, *path_fragments, base_dir:)

      new(path, base_dir)
    end

    def self.canonize(path_fragment, *path_fragments, base_dir: nil)
      base_dir ||= Defaults.base_dir

      path = File.join(path_fragment, path_fragments)

      if not File.absolute_path?(path)
        path = File.join(base_dir, path)
      end
      absolute_path = File.absolute_path(path)

      if absolute_path == base_dir
        path = ''

      elsif absolute_path.start_with?(base_dir)
        root_base_dir = File.dirname(base_dir) == base_dir

        if not root_base_dir
          relative_path_index = base_dir.length + separator_length
        else
          relative_path_index = base_dir.length
        end

        path = absolute_path[relative_path_index..-1]

      else
        path = absolute_path
      end

      path
    end

    def absolute_path
      if File.absolute_path?(path)
        path
      else
        File.join(base_dir, path)
      end
    end

    def gem?
      gem_pattern.match?(self)
    end

    def self.separator_length
      separator = File::ALT_SEPARATOR || File::SEPARATOR
      separator.length
    end

    module Defaults
      def self.base_dir
        Dir.pwd
      end
    end
  end

  def self.SourcePath(path, *path_fragments)
    case path
    when SourcePath
      path
    when String
      SourcePath.build(path, *path_fragments)
    when nil
      SourcePath.build('.')
    else
      raise TypeError, "Cannot coerce #{path.inspect} into a Path"
    end
  end
end
