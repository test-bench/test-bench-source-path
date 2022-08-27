module TestBench
  class SourcePath
    class Pattern
      attr_reader :raw_pattern

      def initialize(raw_pattern)
        @raw_pattern = raw_pattern
      end

      def match?(path, *path_fragments)
        source_path = TestBench::SourcePath(path, *path_fragments)

        path = source_path.path

        wildcard_options = File::FNM_EXTGLOB | File::FNM_PATHNAME | File::FNM_DOTMATCH
        match = File.fnmatch?(raw_pattern, path, wildcard_options)

        match
      end
    end
  end
end
