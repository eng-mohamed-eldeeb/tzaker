class Venue < ApplicationRecord
  belongs_to :company
  has_many :concerts
end
