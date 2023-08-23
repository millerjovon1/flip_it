class Song < ApplicationRecord
  belongs_to :user
  has_many :sources
  validates :title, presence: true
  validates :genre, presence: true
  validates :bpm, presence: true, numericality: { only_integer: true }
  validates :instruments, presence: true
  has_one_attached :audio_file


  def remix?
    Source.where(remix: self).any?
  end

  include PgSearch::Model
  multisearchable against: [:title, :genre, :instruments]
  has_one_attached :photo

end
