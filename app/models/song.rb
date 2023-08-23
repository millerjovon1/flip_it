class Song < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :genre, presence: true
  validates :bpm, presence: true, numericality: { only_integer: true }
  validates :instruments, presence: true
  has_one_attached :audio_file

  include PgSearch::Model
  multisearchable against: [:title, :genre, :instruments]
end
