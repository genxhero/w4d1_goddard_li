class Artwork < ApplicationRecord
  belongs_to :artist,
  primary_ket: :id,
  foreign_key: :artist_id,
  class_name: 'User'
  
end