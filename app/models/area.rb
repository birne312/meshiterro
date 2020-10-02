class Area < ApplicationRecord
  has_many :areas, class_name: 'Area', foreign_key: 'area_id', dependent: :destroy
  belongs_to :area, class_name: 'Area', optional: true
  has_many :shops
end
