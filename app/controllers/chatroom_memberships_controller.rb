class ChatroomMembershipsController < ApplicationController
  def create
    @chatroom_membership = chatroom.chatroom_memberships.find_or_create_by(user_id: current_user.id)
    redirect_to chatroom
  end

  def destroy
    chatroom.chatroom_memberships.where(user_id: current_user.id).destroy_all
    redirect_to chatrooms_path
  end

  private

  def chatroom
    @chatroom ||= Chatroom.find(params[:chatroom_id])
  end
end