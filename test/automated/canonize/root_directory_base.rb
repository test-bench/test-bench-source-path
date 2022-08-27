require_relative '../automated_init'

context "Canonize" do
  context "Root Directory Base" do
    base_dir = Controls::Directory.root

    relative_path = Controls::Directory::Relative.example
    absolute_path = Controls::Directory::Absolute.example(relative_path)

    detail "Root: #{base_dir.inspect}"
    detail "Relative Path: #{relative_path.inspect}"
    detail "Absolute Path: #{absolute_path.inspect}"

    context "Absolute Path Given" do
      path = SourcePath.canonize(absolute_path, base_dir:)

      comment path.inspect

      test do
        assert(path == relative_path)
      end
    end

    context "Relative Path Given" do
      path = SourcePath.canonize(relative_path, base_dir:)

      comment path.inspect

      test do
        assert(path == relative_path)
      end
    end
  end
end
