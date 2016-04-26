class Matcher
  #a
  def bindeo(n)
    return Proc.new {|valor| n = valor}
  end

  #b
  def val(valor)
    return Proc.new {|n| n === valor}
  end

  #c
  def type(tipo)
    #return Proc.new {|algo| algo.class.ancestors.include?(tipo)}
    return Proc.new {|algo| algo.kind_of?(tipo)}
  end

  #d
  def list(values, match_size?)
    aca nos quedamos con el primer valor de las dos listas
    return Proc.new {|lista|
    if(match_size?)
      lista.length == values.length && matchean_listas?(values, lista)
    else
      matchean_listas?(values, lista)
    end
    }
  end

  def matchean_listas?(lista1, lista2)
    l1 = lista1.first
    l2 = lista2.first
    if(lista1.empty?)
      return true
    end
    if(l1 == l2)
      matchean_listas(lista1.drop(1), lista2.drop(1))
    end
    if(duck(:call).call(l1))
      l1.call(l2) && matchean_listas(lista1.drop(1), lista2.drop(1))
    end

  end

  def duck(*metodos)
    return Proc.new {|objeto| (metodos - objeto.class.instance_methods).empty?}
  end

end