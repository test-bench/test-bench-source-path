require_relative '../automated_init'

context "Canonize" do
  context "Symbolic Link" do
    dir = Dir.mktmpdir

    file_path = File.join(dir, "some_file.txt")
    File.write(file_path, "Some text")

    link_path = File.join(dir, "some_link")
    File.symlink(file_path, link_path)

    path = SourcePath.canonize(link_path)

    comment path.inspect
    detail "Link Path: #{link_path}"
    detail "File Path: #{file_path}"

    test "Doesn't follow the symbolic link" do
      assert(path == link_path)
    end

  ensure
    FileUtils.remove_entry(dir)
  end
end
