require 'singleton'
class NullPiece < Piece
  include Singleton
  def initialize
    @color = nil

  end

  def empty?
    true
  end


  def to_s
    "space"
  end
end
