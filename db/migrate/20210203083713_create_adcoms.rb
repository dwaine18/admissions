class CreateAdcoms < ActiveRecord::Migration[6.0]
  def change
    create_table :adcoms do |t|
      t.string :first_name
      t.string :last_name
      t.references :school_id, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
