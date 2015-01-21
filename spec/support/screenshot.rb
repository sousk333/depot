module Screenshot
  def sc_path(file_name)
    Rails.root.join("screenshots", file_name)
  end
end
