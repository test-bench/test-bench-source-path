require_relative '../automated_init'

context "Canonize" do
  base_dir = Controls::Directory.example

  relative_path = Controls::Path::Relative.example

  context "Local Path" do
    absolute_path = File.join(base_dir, relative_path)

    context "Absolute Path Given" do
      path = SourcePath.canonize(absolute_path, base_dir:)

      comment path.inspect
      detail "Base Directory: #{base_dir}"
      detail "Absolute Path: #{absolute_path}"
      detail "Relative Path: #{relative_path}"

      test do
        assert(path == relative_path)
      end
    end

    context "Relative Path Given" do
      path = SourcePath.canonize('.', relative_path, base_dir:)

      comment path.inspect
      detail "Relative Path: #{relative_path}"

      test do
        assert(path == relative_path)
      end
    end
  end

  context "Non-Local Path" do
    absolute_path = Controls::Path::Absolute.example('some-other-dir', relative_path)

    context "Absolute Path Given" do
      path = SourcePath.canonize(absolute_path, base_dir:)

      comment path.inspect
      detail "Absolute Path: #{absolute_path}"

      test do
        assert(path == absolute_path)
      end
    end

    context "Relative Path Given" do
      relative_path = Controls::Path::Relative.example('..', absolute_path)

      path = SourcePath.canonize('..', 'some-other-dir', relative_path, base_dir:)

      comment path.inspect
      detail "Base Directory: #{base_dir}"
      detail "Relative Path: #{relative_path}"
      detail "Absolute Path: #{absolute_path}"

      test do
        assert(path == absolute_path)
      end
    end
  end
end
