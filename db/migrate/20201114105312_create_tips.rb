class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
