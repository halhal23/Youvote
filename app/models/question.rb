class Question < ApplicationRecord
  belongs_to :group
  has_many :choices
  has_many :votes, dependent: :delete_all
  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :title, presence: true
  validates :detail, presence: true
  validates :deadline, presence: true
end
