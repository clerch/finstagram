class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :likes

	validates :photo_url, presence: true

	def humanized_time_ago
		time_ago_in_seconds = Time.new - self.created_at
		time_ago_in_minutes = (time_ago_in_seconds / 60).to_i
		time_ago_in_hours = (time_ago_in_minutes / 60).to_i
		time_ago_in_days = (time_ago_in_hours /24).to_i
		
		if time_ago_in_minutes >= 60 && time_ago_in_hours <= 24 
			"#{time_ago_in_minutes / 60.to_i} hours ago"
		elsif time_ago_in_minutes >= 24 
			"#{time_ago_in_days} days ago"
		else
			"#{time_ago_in_minutes.to_i} minutes ago"
		end
	end

	def like_count
		self.likes.size
	end

	def comment_count
		self.comments.size
	end

end
