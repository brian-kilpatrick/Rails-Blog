class Post < ActiveRecord::Base

	belongs_to :user


	validates :title, presence: true,
					  length: { maximum: 20 }
					  
	validates :content, presence: true,
					  length: { minimum: 20 }


	
	has_many :comments

end
