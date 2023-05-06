class Tikit < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  tikits_number = Tikit.count
end
