class Trip < ActiveRecord::Base
    has_many :days
    has_many :activities, through: :days

    def genDays
        (self.start_date.to_date..self.end_date.to_date).each do |date|
            Day.create(date:date,trip:self)
        end
    end

    def totalCost
        self.activities.sum { |activity| activity.cost }
    end

end