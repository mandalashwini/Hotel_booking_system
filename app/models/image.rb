class Image < ApplicationRecord
	mount_uploader :Image
	belongs_to :imageable,polymorphic: true


	 before_save :update_image_attributes
	 # Delegate

  delegate :url, :size, :path, to: :image

  # Virtual attributes

  alias_attribute :filename, :original_filename

private
  
  def update_image_attributes
    if image.present? && image_changed?
      self.original_filename = image.file.original_filename
      self.content_type = image.file.content_type
    end
  end

end
