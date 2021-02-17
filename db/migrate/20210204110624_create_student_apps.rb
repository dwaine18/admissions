class CreateStudentApps < ActiveRecord::Migration[6.0]
  def change
    create_table :student_apps do |t|
      t.references :student, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true
      t.text :essay
      t.string :status
      t.integer :score1
      t.integer :score2
      t.boolean :completestat

      t.timestamps
    end
  end
end
