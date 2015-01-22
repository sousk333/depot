module Screenshot
  SAVE_DIRECTORY = "screenshots"

  def sc_path(file_name)
    Rails.root.join(SAVE_DIRECTORY, file_name)
  end

  def make_screenshot_save_directory
    return if File.exist?(Rails.root.join(SAVE_DIRECTORY))
    Dir.mkdir Rails.root.join(SAVE_DIRECTORY)
  end

  module_function :make_screenshot_save_directory
end
