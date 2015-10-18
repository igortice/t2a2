require 'set'

class Grafo
  attr_accessor :nodes, :visited
  
  def initialize
    @nodes   = []
    @visited = []
  end
  
  def ligar_nodes(noA, noB)
    noA.adjacente.add noB
    noB.adjacente.add noA
  end
  
  def lista
    @nodes
  end
  
  def bsf(node)
    fila = []
    fila << node
    @visited << node
    
    while fila.any?
      current_node = fila.shift
      current_node.valor
      adjacentes = current_node.adjacente.map.sort_by { |obj| obj.valor }
      adjacentes.each do |adjacent_node|
        next if @visited.include?(adjacent_node)
        fila << adjacent_node
        @visited << adjacent_node
      end
    end
  end
  
  def print_visited
    @visited.map { |vis| vis.valor }
  end
end
