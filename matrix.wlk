object neo {
  var energia = 100
  
  method esElElegido() = true // o const property pero es una referencia sin tanto sentido

  method saltar() {
    energia = energia / 2
  }

  method vitalidad() = energia / 10  

  method energia() = energia

}

object morfeo {
  var vitalidad = 8
  var estaCansado = false

  method esElElegido() = false

  method vitalidad() = vitalidad

  method saltar() {
    vitalidad = 0.max(vitalidad - 1)
    estaCansado = not estaCansado // o !estaCansado
  }

  method estaCansado() = estaCansado
}

object trinity {
  method vitalidad() = 0

  method saltar() {}

  method esElElegido() = false
}


object nave {
  const property pasajeros = [neo, morfeo, trinity] //siempre es la misma lista (mutable), q se le agregan o quitan elementos

  method subirA(unPasajero) {
    pasajeros.add(unPasajero)
  }

  method bajarA(unPasajero) {
    pasajeros.remove(unPasajero)
  }

  method cuantosPasajerosHay() = pasajeros.size()

  method pasajeroMasVital() = pasajeros.max({p => p.vitalidad()}) //transforma a una lista de nros y devuelve el pasajero con mas vit

  method estaElElegido() = pasajeros.any({p => p.esElElegido()})

  method estaEquilibrada() { //???
    return self.pasajeroMasVital().vitalidad() <=
    self.pasajeroMenosVital().vitalidad() * 2 
  }

  method pasajeroMenosVital() = pasajeros.min({p => p.vitalidad()})

  method chocar() {
    pasajeros.forEach({p => p.saltar()}) // pasajeros.forEach({p => p.saltar() self.bajarA(p)})
    pasajeros.clear() //pasajeros.removeAll(self.pasajeros())
  }//pasajeros.forEach({p => self.bajarA(p)})

  method acelerar() {
    self.pasajerosSinElElegido().forEach({p => p.saltar()})
  }

  method pasajerosSinElElegido() = pasajeros.filter({p => not p.esElElegido()})

}