class RidesController < ApplicationController

	def new
		#@ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
		@ride = current_user.rides.build(attraction_id: params[:attraction_id])
		@ride.save
    redirect_to current_user, notice: @ride.take_ride
	end

end
