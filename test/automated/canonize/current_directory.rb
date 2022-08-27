require_relative '../automated_init'

context "Canonize" do
  context "Current Directory" do
    current_directory = Controls::Directory.current

    source_path = SourcePath.canonize('.', base_dir: current_directory)

    detail source_path.inspect

    test "Empty path" do
      assert(source_path.empty?)
    end
  end
end
