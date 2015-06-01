class Exercise < ActiveRecord::Base
	has_many :goals

  default_scope -> {order(name: :desc)}
	def self.search(search)
		if search
    	where('name LIKE ?', "%#{search}%")
  	end
	end
	
end
