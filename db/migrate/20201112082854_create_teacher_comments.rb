class CreateTeacherComments < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_comments do |t|
      t.references :article, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
