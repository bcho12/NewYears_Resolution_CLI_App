class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |c|
      c.string :name
    end
  end
end
