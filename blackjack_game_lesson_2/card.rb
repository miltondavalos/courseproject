class Card
  attr_reader :suit, :face_value

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  def to_s
    "#{face_value} of #{find_suit}"
  end

  def find_suit
    case suit
      when 'H'
        'Hearts'
      when 'D'
        'Diamonds'
      when 'S'
        'Spades'
      when 'C'
        'Clubs'
      end
  end
end
