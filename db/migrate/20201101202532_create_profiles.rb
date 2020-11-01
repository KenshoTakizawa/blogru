class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.string :learning_history, null: false
      t.text :purpose, null: false
      t.date :birth_date

      t.timestamps
    end
  end
end
