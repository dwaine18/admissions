class RemoveEmailFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :email, :string
  end
end
