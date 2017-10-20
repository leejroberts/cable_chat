class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(
      "chatrooms_#{message.chatroom.id}_channel",
      message: render_message(message))
    puts "I DID THE JOB!!!!!!"
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end