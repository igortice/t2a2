require 'set'

class Grafo
  attr_accessor :nodes, :visited
  
  def initialize
    @nodes   = [nil]
    @visited = []
  end
  
  def ligar_node(noA, noB)
    noA.adjacente.add noB
  end
  
  def lista
    @nodes
  end
  
  def dsf(node)
    return if @visited.include?(node)
    @visited << node
    adjacentes = node.adjacente.map.sort_by { |obj| obj.valor }
    adjacentes.each do |adjacente_node|
      dsf(adjacente_node) unless @visited.include?(adjacente_node)
    end
    
    restantes_visitar = (@nodes - @visited).compact.sort_by { |obj| obj.valor }
    restantes_visitar.each do |node|
      dsf(node)
    end
  end
  
  def print_visited
    @visited.map { |vis| vis.valor }
  end
end
