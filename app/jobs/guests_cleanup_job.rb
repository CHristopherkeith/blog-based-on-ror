class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	# p args[0]
  	# p Time.new
  	p "HHHHHHHHHHHHHHHHHHHHHHHHH"
  	# p args
  	p Article.find(args[0]).text
    # Do something later
  end
end
