class Exercise < ActiveRecord::Base
	belongs_to :goals

	def self.search(search)
		if search
    		where('name LIKE ?', "%#{search}%")
  		end
	end
	
end
