class RemoveSchoolIdIdFromPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :school_id_id, :integer
  end
end
