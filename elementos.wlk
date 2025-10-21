import plagas.*


class Hogar {
  var nivelDeMugre 
  const nivelDeConfort

  method esBueno() = nivelDeMugre <= nivelDeConfort / 2

  method estaAtacadoPor(unaPlaga) {
    nivelDeMugre += unaPlaga.nivelDeDanio()
    unaPlaga.atacarElemento()
  }
}

class Huerta {
  var capacidadDeProduccion
  
  method esBueno() = capacidadDeProduccion > nivelMinimo.valor()
  method estaAtacadoPor(unaPlaga) {
   capacidadDeProduccion = 0.max(capacidadDeProduccion -(unaPlaga.nivelDeDanio()*0.1))
    unaPlaga.atacarElemento()
  }
}
object nivelMinimo {
  var property valor = 100
}

class Mascota {
  var nivelDeSalud

  method esBueno() = nivelDeSalud > 250
  method estaAtacadoPor(unaPlaga) {
    nivelDeSalud = 0.max(nivelDeSalud - if (unaPlaga.transmiteEnfermedad()) unaPlaga.nivelDeDanio() else 0)
    nivelDeSalud = 0.max(nivelDeSalud - if (unaPlaga.transmiteEnfermedad()) unaPlaga.transmiteEnfermedades() else 0)
    unaPlaga.atacarElemento()
  }
}

class Barrio {
  const elementos = []

  method agregarElementoAlBarrio(unElemento) {
    elementos.add(unElemento)
  }
  method sacarElementoAlBarrio(unElemento) {
    elementos.remove(unElemento)
  }
  
  method hayElementoBueno() = elementos.any().esBueno()

  method esCopado() = elementos.count ({e => e.esBueno()}) > elementos.count ({e => !e.esBueno()}) 
}