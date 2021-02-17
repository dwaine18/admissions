class RemoveSchoolIdIdFromAdcoms < ActiveRecord::Migration[6.0]
  def change
    remove_column :adcoms, :school_id_id, :integer
  end
end
