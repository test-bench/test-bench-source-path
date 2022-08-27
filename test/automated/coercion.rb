require_relative 'automated_init'

context "Coercion" do
  filename = Controls::Path.filename

  context "String" do
    source_path = TestBench::SourcePath('.', filename)

    test "Coerced" do
      assert(source_path.instance_of?(SourcePath))
    end

    context "Raw Path" do
      path = source_path.path

      test "Canonized" do
        assert(path == filename)
      end
    end
  end

  context "Source Path" do
    control_path = SourcePath.build(filename)

    source_path = TestBench::SourcePath(control_path)

    test "Coerced" do
      assert(source_path.instance_of?(SourcePath))
    end

    context "Raw Path" do
      path = source_path.path

      test do
        assert(path == control_path.path)
      end
    end
  end

  context "Nil" do
    source_path = TestBench::SourcePath(nil)

    test "Coerced" do
      assert(source_path.instance_of?(SourcePath))
    end

    context "Raw Path" do
      path = source_path.path

      test do
        assert(path.empty?)
      end
    end
  end

  context "Other Type" do
    test "Is an error" do
      assert_raises(TypeError) do
        TestBench::SourcePath(11)
      end
    end
  end
end
