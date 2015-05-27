class Goal < ActiveRecord::Base
	has_many :exercises
	belongs_to :users
end
