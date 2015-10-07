require 'pry'
require 'highline/import'
require 'matrix'
require 'awesome_print'
require 'terminal-table'


lista   = {}
arestas = []
loop do
  system('clear')
  say('Menu Opções')
  menu1 = ["1. Adicionar vertice: #{lista.keys unless lista.empty?}", "2. Adicionar aresta: #{arestas.map { |e| "V#{e[0]};V#{e[1]}" } if arestas.count != 0}", '3. Remover vertice:', '4. Remover aresta:']
  say(menu1.map { |c| "  #{c}\n" }.join)
  if lista.count != 0
    say('Lista Adjacente.')
    lista.each do |k, v|
      puts "[#{k}] : #{v.join('->')}"
    end
  end
  case ask('Escolha: ', %w(1 2 3 4))
    when '1'
      lista[(lista.keys.empty? && 'V1') || ("#{lista.keys.last.next}")] = []
    when '2'
      unless lista.empty?
        say("Escolha vertice 1 : \n" + lista.map { |k, v| (k.split('').last + '. '+ k + "\n") }.join)
        r1 = ask('Escolha: ', lista.map { |k, v| k.split('').last }).to_i
        say("Escolha vertice 2 : \n" + lista.map { |k, v| (k.split('').last + '. '+ k + "\n") }.join)
        r2 = ask('Escolha: ', lista.map { |k, v| k.split('').last }).to_i
        unless arestas.include? [r1, r2]
          arestas << [r1, r2]
          lista["V#{r1}"] << r2
        end
      else
        system('clear')
        say('Não existem vertices!')
      end
    when '3'
      unless lista.empty?
        say("Escolha vertice a remover : \n" + lista.map { |k, v| (k.split('').last + '. '+ k + "\n") }.join)
        r = ask('Escolha: ', lista.map { |k, v| k.split('').last }).to_i
        arestas.reject! { |e| e.include?(r) }
        lista.delete("V#{r}")
        lista.each{|k, v| p v.delete(r)}
      else
        system('clear')
        say('Não existem vertices!')
      end
    when '4'
      if arestas.count != 0
        say("Escolha uma aresta a remover : \n #{arestas.map.with_index { |e, i| "#{i+1}. V#{e[0]};V#{e[1]}" + "\n" }.join}")
        r = ask('Escolha: ', arestas.map.with_index { |e, i| "#{i+1}" }).to_i
        k = arestas[r-1][0]
        v = arestas[r-1][1]
        arestas.delete_at(r.to_i-1)
        lista["V#{k}"].delete(v)
      else
        system('clear')
        say('Não existem vertices!')
      end
    else
  end
end
