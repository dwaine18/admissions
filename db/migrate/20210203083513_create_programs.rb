class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :program_name
      t.string :description
      t.references :school_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
