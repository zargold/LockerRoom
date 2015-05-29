class Exercise < ActiveRecord::Base
	has_one :goals

	def self.search(search)
		if search
    		where('name LIKE ?', "%#{search}%")
  		end
	end
	
end
