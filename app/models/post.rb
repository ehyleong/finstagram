class Post < ActiveRecord::Base
    
    #these are associations
    belongs_to :user
    has_many :comments
    has_many :likes
    
    #validations in between association definitions and methods
    validates_presence_of :photo_url, :user
    
    #logic for displaying time in a readable manner
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60
        
        if time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes / 60).to_i} hours ago"
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
    end
    
    #logic for displaying like count as equal to post's number of likes
    def like_count
        self.likes.size
    end
    
    #logic for displaying comment count as equal to post's number of likes
    def comment_count
        self.comments.size
    end
    
end