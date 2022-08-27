module TestBench
  class SourcePath
    def self.canonize(path_fragment, *path_fragments, base_dir: nil)
      base_dir ||= Dir.pwd

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

    def self.separator_length
      separator = File::ALT_SEPARATOR || File::SEPARATOR
      separator.length
    end
  end
end
