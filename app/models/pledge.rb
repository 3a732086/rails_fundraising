class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project_support
  has_one :payment

  enum status: [:not_paid, :paid, :canceled]

  validates :project_name, :support_name, presence: true
  validates_numericality_of :support_price, greater_than_or_equal_to: 0
  validates_numericality_of :quantity, greater_than_or_equal_to: 1

end
