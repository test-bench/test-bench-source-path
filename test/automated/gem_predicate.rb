require_relative 'automated_init'

context "Gem Predicate" do
  context "Path Is Inside a Gem Directory" do
    context "Absolute Path" do
      path = Controls::Path::Absolute::Gem.example

      source_path = TestBench::SourcePath(path)

      comment source_path.path.inspect

      test do
        assert(source_path.gem?)
      end
    end

    context "Relative Path" do
      path = Controls::Path::Relative::Gem.example

      source_path = TestBench::SourcePath(path)

      comment source_path.path.inspect

      test do
        assert(source_path.gem?)
      end
    end
  end

  context "Path Isn't Inside a Gem Directory" do
    path = Controls::Path.example

    source_path = TestBench::SourcePath(path)

    comment source_path.path.inspect

    test do
      refute(source_path.gem?)
    end
  end
end
