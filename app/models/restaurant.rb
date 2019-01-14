class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :tags, as: :tagable
  accepts_nested_attributes_for :tags

  validates :user_id, presence: true
  validates :name, presence: true
  validates :visit_date, presence: true
end
