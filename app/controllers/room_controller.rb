class RoomController < ApplicationController
  def list
    @rooms = Room.find(:all, :params => { :user_name => "me" })
  end

  def show
    @room = Room.find(:all, :params => { :user_name => "me", :name => params[:id]}).first
  end

  def update
  end
end
