class QuizChannel < ApplicationCable::Channel
  def subscribed
    stream_from "quiz_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def timer_set(data)
    data["timer"].to_i.downto(0) do |i|
      ActionCable.server.broadcast 'quiz_channel', timer: i
      sleep 1
      break if i.zero?
    end
  end
end
