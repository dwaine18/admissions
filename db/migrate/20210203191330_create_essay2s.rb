class CreateEssay2s < ActiveRecord::Migration[6.0]
  def change
    create_table :essay2s do |t|
      t.belongs_to :student_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
