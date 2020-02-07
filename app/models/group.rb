class Group < ApplicationRecord
  has_many :user_group_relations, dependent: :delete_all
  has_many :users, through: :user_group_relations
end
