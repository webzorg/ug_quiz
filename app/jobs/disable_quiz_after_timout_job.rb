class DisableQuizAfterTimoutJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # failsafe to disable quiz in case professor tab is closed and request is not sent on timeout."
    args.first.update_attributes(active: false) if args.first.active?
  end
end
