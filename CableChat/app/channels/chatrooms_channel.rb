class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms_#{params['chatroom_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def from_server

  end

  def send_message(data)
    # this actually receives messages.
    # above function is connected to a identically named funtion on the client side
    current_user.messages.create!(body: data["message"], chatroom_id: data['chatroom_id'])
    # process data sent from the page
  end
end
