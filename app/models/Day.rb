class Day < ActiveRecord::Base
    has_many :activities
    belongs_to :trip

    def dayCost
        self.activities.sum{ |a| a.cost }
    end
end