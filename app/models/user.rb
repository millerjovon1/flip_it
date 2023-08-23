class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :crates, dependent: :destroy
  has_many :crate_songs, through: :crates
  has_many :sources, through: :songs
  validates :name, presence: true
  validates :artist_name, presence: true, uniqueness: true
  # has_one_attached :profile_photo


  def remixes
    self.songs.select { |song| song.remix? }
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
