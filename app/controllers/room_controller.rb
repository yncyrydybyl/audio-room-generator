class RoomController < ApplicationController
  def list
    @rooms = Room.find(:all, :params => { :user_name => "me" })
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
		@room = Room.find(params[:_id])
		@room.name = params[:name]
		@room.description = params[:description]
		@room.save
  end
end
