class Goal < ActiveRecord::Base
	belongs_to :exercise
	belongs_to :users
end
