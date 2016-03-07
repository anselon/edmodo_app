class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :img_path
      t.string :seller_thumb_url
      t.string :edmodo_url
      t.integer :price
      t.integer :currency
      t.integer :avg_rating
      t.integer :num_raters
      t.text :long_desc_html
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
