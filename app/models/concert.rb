class Concert < ApplicationRecord
  belongs_to :singer
  belongs_to :company
  belongs_to :venue
end
