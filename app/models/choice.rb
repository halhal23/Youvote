class Choice < ApplicationRecord
  belongs_to :question
  has_many :votes, dependent: :delete_all

  validates :name, presence: true
end
