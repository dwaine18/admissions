class AddUserTypeToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :user_type, :string
  end
end
