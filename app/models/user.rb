class User < ActiveRecord::Base

	has_many :posts
	
	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates_presence_of :fname
	validates_presence_of :lname
	validates :username, :presence => true,
						 :uniqueness => {:case_sensitive => false},
						 :length => {:maximum => 12 }
	# validates :email, :presence => true, 
	# 				  :format => EMAIL_REGEX,
	# 			  	  :uniqueness => true,

	
	has_many :comments

end
