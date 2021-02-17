class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.references :student_id, null: false, foreign_key: true
      t.references :program_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
