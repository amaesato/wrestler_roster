class Wrestler < ApplicationRecord
  has_many :tournaments

  validates_presence_of :name, :age, :weight
end
