class Category < ActiveRecord::Base
  has_many :resolution_categories
  has_many :resolutions, :through => :resolution_categories
end
