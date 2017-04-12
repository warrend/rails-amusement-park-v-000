class ChangeUserDataTypes < ActiveRecord::Migration
  def change
  	change_column :users, :tickets, :integer
  	change_column :users, :nausea, :integer
  	change_column :users, :happiness, :integer
  end
end
