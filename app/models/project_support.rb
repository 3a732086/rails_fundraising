class ProjectSupport < ApplicationRecord
  belongs_to :project
  has_many :pledges

  enum status: [:is_hidden, :is_published]

  validates :name, :description, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0
end
