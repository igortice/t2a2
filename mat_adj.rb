require 'pry'
require 'highline/import'
require 'matrix'
require 'awesome_print'
require 'terminal-table'


matriz   = []
vertices = []
arestas  = []
loop do
  system('clear')
  say('Menu Opções')
  menu1 = ["1. Adicionar vertice: #{vertices if matriz.count != 0}", "2. Adicionar aresta: #{arestas.map { |e| "V#{e[0]};V#{e[1]}" } if arestas.count != 0}", '3. Remover vertice:']
  say(menu1.map { |c| "  #{c}\n" }.join)
  if matriz.count != 0
    say('Matriz Adjacente.')
    puts Terminal::Table.new :rows => matriz
  end
  case ask('Escolha: ', %w(1 2 3))
    when '1'
      if matriz.count == 0
        matriz << [0]
      else
        matriz.each { |ele| ele << 0 }
        matriz << Array.new(matriz.last.count, 0)
      end
      vertices << "V#{matriz.count}"
    when '2'
      if vertices.count != 0
        say("Escolha vertice 1 : \n" + vertices.map { |k| k.split('').last+'. '+k+"\n" }.join)
        v1 = ask('Escolha: ', vertices.map { |e| e.split('').last })
        say("Escolha vertice 2 : \n" + vertices.map { |k| k.split('').last+'. '+k+"\n" }.join)
        v2 = ask('Escolha: ', vertices.map { |e| e.split('').last })
        arestas << [v1.to_i, v2.to_i]
        arestas.uniq!
        matriz[arestas.last[0]-1][arestas.last[1]-1] = 1
      else
        system('clear')
        say('Não existem vertices!')
      end
    when '3'
      say("Escolha vertice a remover : \n" + vertices.map { |k| k.split('V').last+'. '+k+"\n" }.join)
      r = ask('Escolha: ')
      matriz.delete_at(r.to_i-1)
      matriz.each { |e| e.delete_at(r.to_i-1) }
      vertices.delete_at(r.to_i-1)
      arestas.each_with_index { |val, ind| arestas.delete_at(ind) if val.include? r.to_i }
    else
  end
end
