class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :note

      t.timestamps
    end
  end
end
