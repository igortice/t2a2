require 'pry'
require 'awesome_print'

require_relative 'no'
require_relative 'grafo'

grafo = Grafo.new

6.times do |i|
  grafo.nodes << No.new("V#{i+1}")
end

grafo.ligar_node(grafo.nodes[1], grafo.nodes[2])
grafo.ligar_node(grafo.nodes[1], grafo.nodes[4])
grafo.ligar_node(grafo.nodes[4], grafo.nodes[2])
grafo.ligar_node(grafo.nodes[2], grafo.nodes[5])
grafo.ligar_node(grafo.nodes[5], grafo.nodes[4])
grafo.ligar_node(grafo.nodes[3], grafo.nodes[5])
grafo.ligar_node(grafo.nodes[3], grafo.nodes[6])
grafo.ligar_node(grafo.nodes[6], grafo.nodes[6])

grafo.dsf(grafo.nodes[1])

p grafo.print_visited
