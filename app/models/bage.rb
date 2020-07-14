class Bage < ApplicationRecord

  has_many :bage_passages
  has_many :users, through: :bage_passages
  belongs_to :rule
end
