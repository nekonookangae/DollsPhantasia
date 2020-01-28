class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.references :category, foreign_key: true
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
