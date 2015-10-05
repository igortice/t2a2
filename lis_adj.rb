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
      puts "[#{idx+1}] : #{ele.join('->')}"
    end
  end
  case ask('Escolha: ', %w(1 2 3))
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
    else
  end
end
