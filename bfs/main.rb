require 'pry'
require 'awesome_print'

require_relative 'no'
require_relative 'grafo'

grafo = Grafo.new

8.times do |i|
  grafo.nodes << No.new("V#{i}")
end

grafo.ligar_nodes(grafo.nodes[0], grafo.nodes[2])
grafo.ligar_nodes(grafo.nodes[2], grafo.nodes[6])
grafo.ligar_nodes(grafo.nodes[6], grafo.nodes[4])
grafo.ligar_nodes(grafo.nodes[4], grafo.nodes[5])
grafo.ligar_nodes(grafo.nodes[5], grafo.nodes[0])
grafo.ligar_nodes(grafo.nodes[0], grafo.nodes[7])
grafo.ligar_nodes(grafo.nodes[7], grafo.nodes[1])
grafo.ligar_nodes(grafo.nodes[7], grafo.nodes[4])
grafo.ligar_nodes(grafo.nodes[3], grafo.nodes[4])
grafo.ligar_nodes(grafo.nodes[3], grafo.nodes[5])

grafo.bsf(grafo.nodes[0])

p grafo.print_visited
