class AddUserIdToAdcoms < ActiveRecord::Migration[6.0]
  def change
    add_reference :adcoms, :user, foreign_key: true
  end
end
