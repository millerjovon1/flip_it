class Crate < ApplicationRecord
  belongs_to :user
  has_many :crate_songs, dependent: :destroy
  has_many :songs, through: :crate_songs
  validates :name, presence: true
end
