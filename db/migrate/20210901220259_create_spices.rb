class CreateSpices < ActiveRecord::Migration[6.1]
  def change
    create_table :spices do |t|
      t.string :title
      t.string :notes
      t.string :description
      t.string :image
      t.float :rating
      t.timestamps
    end
  end
end
