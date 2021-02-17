class CreateEssays < ActiveRecord::Migration[6.0]
  def change
    create_table :essays do |t|
      t.references :school_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
