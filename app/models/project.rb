class Project < ActiveRecord::Base
	has_many :assets
	validates :title, presence: true,
                    length: { minimum: 5 }

end
