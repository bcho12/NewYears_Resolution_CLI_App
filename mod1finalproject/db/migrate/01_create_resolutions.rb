class CreateResolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :resolutions do |r|
      r.string :content
    end
  end
end
