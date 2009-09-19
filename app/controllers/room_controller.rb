class RoomController < ApplicationController
  def list
    @rooms = Room.find(:all, :params => { :user_name => "me" })
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
  end
end
