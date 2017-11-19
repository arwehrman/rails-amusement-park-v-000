class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if @user.tickets <=4 && @user.height <= 30
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets <= 4
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @user.height <= 30
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @attraction.tickets <= @user.tickets
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      return "Thanks for riding the #{@attraction.name}!"
    end
  end
end
