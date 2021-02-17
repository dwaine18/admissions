class AddSchoolIdToAdcoms < ActiveRecord::Migration[6.0]
  def change
    add_reference :adcoms, :school, null: false, foreign_key: true
  end
end
