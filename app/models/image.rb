class Image < ApplicationRecord
  belongs_to :shop
  mount_uploader :image, ImageUploader
  enum status: {rectangle: 0, square: 1}
end
