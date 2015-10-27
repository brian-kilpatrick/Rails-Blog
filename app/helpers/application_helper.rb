module ApplicationHelper
	def created_ago(x)
		"Created " + distance_of_time_in_words(x, Time.now) + " ago"
	end
end
