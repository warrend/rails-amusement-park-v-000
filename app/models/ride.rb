class Ride < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user

	def take_ride
		if too_short && not_enough_tix
			 "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
		elsif too_short
			"Sorry. You are not tall enough to ride the #{self.attraction.name}."
		elsif not_enough_tix
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		elsif self.user.tickets >= self.attraction.tickets && self.user.height > self.attraction.min_height
			self.user.tickets -= self.attraction.tickets
			self.user.nausea += self.attraction.nausea_rating
			self.user.happiness += self.attraction.happiness_rating
			self.user.save
			"Thanks for riding the #{self.attraction.name}!"
		end
	end

	def too_short
		self.user.height < self.attraction.min_height
	end

	def not_enough_tix
		self.user.tickets < self.attraction.tickets
	end

end
