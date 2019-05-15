class ResolutionCategory < ActiveRecord::Base
  belongs_to :resolution
  belongs_to :category
end
