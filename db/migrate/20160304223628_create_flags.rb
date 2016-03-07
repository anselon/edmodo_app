class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string :reason
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
