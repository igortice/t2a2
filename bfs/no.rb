require 'set'

class No
  attr_accessor :valor, :adjacente
  
  def initialize(valor)
    @adjacente = Set.new
    @valor     = valor
  end
end
