class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :name
      t.string :image
      t.string :video
      t.text :content_area_1

      t.timestamps
    end
  end
end
