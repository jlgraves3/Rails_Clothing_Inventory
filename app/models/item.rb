class Item < ApplicationRecord
	belongs_to :brand
	belongs_to :color
	belongs_to :type
	validates_presence_of :name
	validates_presence_of :price
	validates_presence_of :size
	validates_presence_of :src
	# validates :src, allow_nil: true
	validates_presence_of :color_id
	validates_presence_of :brand_id
	validates_presence_of :type_id

end
