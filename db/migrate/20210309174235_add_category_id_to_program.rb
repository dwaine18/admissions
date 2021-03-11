class AddCategoryIdToProgram < ActiveRecord::Migration[6.0]
  def change
    add_column :programs, :category_id, :integer
  end
end
