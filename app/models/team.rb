class Team < ActiveRecord::Base
  has_and_belongs_to_many :matches
  has_many :bets

  validates :code, :presence => true, :uniqueness => true

  def flag_url
    'flags/' + code + '.png'
  end
end
