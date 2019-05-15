class Resolution < ActiveRecord::Base
  has_many :resolution_categories
  has_many :categories, :through => :resolution_categories
end
