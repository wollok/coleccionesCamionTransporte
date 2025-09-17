object knightRider {
	method peso() { return 500 }
	method peligrosidad() { return 10 }
	method bultos() = 1
	method accidente() {}
}


object arenaAGranel {
	var property peso = 0
	method peligrosidad() = 1
	method bultos() = 1
	method accidente() { peso = peso + 20}
}


object bumblebee {
	var property modo = robot
	method peso() = 800
	method peligrosidad() {return modo.peligrosidad()} 
	method bultos() = 2
	method accidente() {modo = modo.opuesto()}

}
object robot {
	method peligrosidad() = 30
	method opuesto() = auto
}
object auto {
	method peligrosidad() = 15
	method opuesto() = robot
}
object paqueteLadrillos {
	var property cantidad = 0
	method peso() =  cantidad * 2
	method peligrosidad() = 2
	method bultos() {
		if (cantidad <= 100) {
			return 1
		}
		else if (cantidad <= 300) {
			return 2
		}
		else {
			return 3
		}

	} 
	method accidente() {
		cantidad = (cantidad - 12).max(0)
	}
}

object bateriaAntiaerea {
	var property modo = descargada
	method peso() = modo.peso()
	method peligrosidad() = modo.peligrosidad()
	method bultos() = modo.bultos()
	method accidente() { modo = descargada} 
}

object descargada {
	method peso() = 200
	method peligrosidad() = 0
	method bultos() = 1
}
object cargada {
	method peso() = 300
	method peligrosidad() = 100
	method bultos() = 2
}
object residuos {
	var property peso = 0
	method peligrosidad() = 200
	method bultos() = 1
	method accidente() { peso = peso + 15}
}


object embalaje {
	var property cosa = null

	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad()/2 
	method bultos() = 2
	method accidente() {}
}

object contenedor {
	var property cosas = #{}

	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	method peligrosidad() = if (cosas.isEmpty()) 0 else cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()
	method bultos() = 1 + cosas.sum({cosa => cosa.bultos()})
	method accidente() {
		cosas.forEach({cosa => cosa.accidente()})
	}
}
