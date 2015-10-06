require 'pry'
require 'highline/import'
require 'matrix'
require 'awesome_print'
require 'terminal-table'


lista    = []
vertices = []
arestas  = []
loop do
  system('clear')
  say('Menu Opções')
  menu1 = ["1. Adicionar vertice: #{vertices if lista.count != 0}", "2. Adicionar aresta: #{arestas.map { |e| "V#{e[0]};V#{e[1]}" } if arestas.count != 0}", '3. Remover vertice:', '4. Remover aresta:']
  say(menu1.map { |c| "  #{c}\n" }.join)
  if lista.count != 0
    say('Lista Adjacente.')
    lista.each_with_index do |ele, idx|
      puts "[#{vertices[idx].split('').last}] : #{ele.join('->')}" if vertices[idx]
    end
  end
  case ask('Escolha: ', %w(1 2 3 4))
    when '1'
      lista << []
      vertices << "V#{lista.count}"
    when '2'
      if vertices.count != 0
        say("Escolha vertice 1 : \n" + vertices.map { |k| k.split('').last+'. '+k+"\n" }.join)
        v1 = ask('Escolha: ', vertices.map { |e| e.split('').last })
        say("Escolha vertice 2 : \n" + vertices.map { |k| k.split('').last+'. '+k+"\n" }.join)
        v2 = ask('Escolha: ', vertices.map { |e| e.split('').last })
        unless arestas.include? [v1.to_i, v2.to_i]
          arestas << [v1.to_i, v2.to_i]
          lista[v1.to_i - 1] << v2
          lista[v2.to_i - 1] << v1 if v1 != v2
        end
      else
        system('clear')
        say('Não existem vertices!')
      end
    when '3'
      if vertices.count != 0
        say("Escolha vertice a remover : \n" + vertices.map { |k| k.split('V').last+'. '+k+"\n" }.join)
        r = ask('Escolha: ')
        lista.each { |e| e.delete_if { |ele| ele == r } }
        vertices.delete_at(r.to_i-1)
        arestas.reject!{|e| e.include?(r.to_i)}
      else
        system('clear')
        say('Não existem vertices!')
      end
    when '4'
      if arestas.count != 0
        say("Escolha uma aresta a remover : \n#{arestas.map.with_index { |e, i| "#{i+1}. V#{e[0]};V#{e[1]}" + "\n" }.join}")
        r = ask('Escolha: ')
        x = arestas[r.to_i-1][0]
        y = arestas[r.to_i-1][1]
        arestas.delete_at(r.to_i-1)
        lista.each { |e| e.delete_if { |ele| ele.to_i == x || ele.to_i == y } }
      else
        system('clear')
        say('Não existem vertices!')
      end
    else
  end
end
