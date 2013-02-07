class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :caption
      t.text :body
      t.string :slug

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
