class Song < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :title, presence: true
  validates :genre, presence: true
  validates :bpm, presence: true, numericality: { only_integer: true }
  validates :instruments, presence: true
  has_one_attached :audio_file
end
