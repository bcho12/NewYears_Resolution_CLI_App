class CreateResolutionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :resolution_categories do |f|
      f.belongs_to :resolution, index: true
      f.belongs_to :category, index: true
    end
  end
end
