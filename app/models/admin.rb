class Admin < ActiveRecord::Base
	attr_accessible :email, :password

	validates :password, :presence => true

	validates :email, :presence => true,
				 	  :uniqueness => { :case_sensitive => false },
					  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }		
end
