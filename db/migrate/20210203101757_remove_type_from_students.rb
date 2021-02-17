class RemoveTypeFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :type, :string
  end
end
