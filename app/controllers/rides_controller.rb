class RidesController < ApplicationController
  def create
    @ride = Ride.create(user: current_user, attraction_id: params[:attraction].to_i)
    @message = @ride.take_ride
    redirect_to user_path(@ride.user, :message => @message)
  end

end
