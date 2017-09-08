class Item < ApplicationRecord
	belongs_to :brand
	belongs_to :color
	belongs_to :type
end
