class CreateTutorials < ActiveRecord::Migration[6.0]
  def change
    create_table :tutorials do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :tuto_category_id, null: false

      t.timestamps
    end
  end
end
