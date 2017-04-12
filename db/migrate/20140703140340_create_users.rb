class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name
			t.string :password_digest
			t.string :nausea
			t.string :happiness
			t.string :tickets
			t.integer :height
			t.boolean :admin, default: false
		end
	end
end
