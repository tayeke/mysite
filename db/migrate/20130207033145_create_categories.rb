class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.text :caption

      t.timestamps
    end
    add_index :categories, :slug, unique: true
  end
end
