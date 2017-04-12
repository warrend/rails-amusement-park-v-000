class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides

	# validates_presence_of :name, :password, :nausea, :happiness, :tickets, :height
	# validates :tickets, :nausea, :happiness, :height, numericality: { only_integer: true }

	has_secure_password

	def mood
		self.happiness > self.nausea ? "happy" : "sad"	
	end
end
