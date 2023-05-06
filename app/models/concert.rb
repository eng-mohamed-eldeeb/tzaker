class Concert < ApplicationRecord
  belongs_to :singer
  belongs_to :company
  belongs_to :venue
  has_many :tikits

  # validates :status, inclusion: { in: %w[accepted rejected] }


  def pending_by_singer?
    status == 'pending_by singer'
  end

  def pending_by_company?
    status == 'pending_by company'
  end

end
