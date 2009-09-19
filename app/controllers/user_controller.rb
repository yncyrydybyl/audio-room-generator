class UserController < ApplicationController
  def render_room
    render :text => Room.find(:all,
      :params => {
        :user_name => params[:user_name],
        :room_name => params[:room_name] }).first.to_json
  end
end
