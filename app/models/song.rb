class Song < ApplicationRecord
  belongs_to :user
  has_many :sources
  validates :title, presence: true
  validates :genre, presence: true
  validates :bpm, presence: true, numericality: { only_integer: true }
  validates :instruments, presence: true
  has_one_attached :audio_file
  has_one_attached :photo
  scope :originals, -> {joins("LEFT OUTER JOIN sources on songs.id = sources.remix_id").where("sources.remix_id is null")}
  scope :remixes, -> {joins("INNER JOIN sources on songs.id = sources.remix_id") }
  GENRES = ['Hip Hop', 'Jazz', 'Country', 'Funk', 'Classical', 'World', 'Rock', 'Folk', 'Blues']
  INSTRUMENTS = ['Piano', 'Drums', 'Cello', 'Violin', 'Xylophone', 'Electric Guitar', 'Organ', 'Ukelele']

  def remix?
    Source.where(remix: self).any?
  end

  include PgSearch::Model
  multisearchable against: [:title, :genre, :instruments, :bpm]
  has_one_attached :photo

end
