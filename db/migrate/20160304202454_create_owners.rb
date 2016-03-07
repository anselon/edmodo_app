class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :store_url
      t.string :edmodo_url
      t.string :edmodo_id

      t.timestamps null: false
    end
  end
end
