class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def total_memb_amount
        amount = 0
        self.memberships.each do |m|
            amount += m.charge
        end
        amount
    end

end
