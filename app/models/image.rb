class Image < ApplicationRecord
	mount_uploader :Image
	belongs_to :imageable,polymorphic: true
end
