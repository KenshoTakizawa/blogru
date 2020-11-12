class CreateTeacherEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.float :rate, null: false, default: 0
      t.text :review

      t.timestamps
    end
  end
end
