class Team < ActiveRecord::Base
  has_and_belongs_to_many :matches
  has_many :bets

  validates_uniqueness_of :code
  validates_presence_of :code

  def flag_url
    'flags/' + code + '.png'
  end
end
