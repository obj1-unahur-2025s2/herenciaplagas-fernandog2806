class Plaga {
  var poblacion

  method transmiteEnfermedad() = poblacion >= 10

  method atacarElemento() {
    poblacion += poblacion * 0.1
  }
}

class PlagaDeCucaracha inherits Plaga {  
  var pesoPromedio  
  
  method nivelDeDanio() = poblacion / 2  
  
  override method transmiteEnfermedad() = super() and  (pesoPromedio >= 10)

  override method atacarElemento(){
    super() 
    pesoPromedio += 2
    
  }
}

class PlagaDePulga inherits Plaga {
  method nivelDeDanio() = poblacion * 2
}

class PlagaDeGarrapata inherits PlagaDePulga {
  override method atacarElemento() {
    poblacion += poblacion * 0.2
  }
}

class PlagaDeMosquito inherits Plaga {
  method nivelDeDanio() = poblacion
 
  override method transmiteEnfermedad() = super() and ((poblacion % 3) == 0) 
}