require_relative 'automated_init'

context "Absolute Path" do
  base_dir = Controls::Directory.example

  context "Absolute Path Given" do
    path = Controls::Path::Absolute.example

    source_path = SourcePath.build(path, base_dir:)

    absolute_path = source_path.absolute_path

    comment absolute_path.inspect

    test do
      assert(absolute_path == path)
    end
  end

  context "Relative Path Given" do
    path = Controls::Path::Relative.example
    control_path = File.join(base_dir, path)

    source_path = SourcePath.build(path, base_dir:)

    absolute_path = source_path.absolute_path

    comment absolute_path.inspect
    detail "Absolute Path: #{control_path.inspect}"

    test do
      assert(absolute_path == control_path)
    end
  end
end
