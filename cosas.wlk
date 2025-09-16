object knightRider {
	method peso() { return 500 }
	method peligrosidad() { return 10 }
}

object arenaAGranel {
	var property peso = 0
	method peligrosidad() = 1
}

object bumblebee {
	var property modo = robot
	method peso() = 800
	method peligrosidad() {return modo.peligrosidad()} 


}
object robot {
	method peligrosidad() = 30
}
object auto {
	method peligrosidad() = 15
}
object paqueteLadrillos {
	var property cantidad = 0
	method peso() =  cantidad * 2
	method peligrosidad() = 2
}

object bateriaAntiaerea {
	var property modo = descargada
	method peso() = modo.peso()
	method peligrosidad() = modo.peligrosidad()
}
object descargada {
	method peso() = 200
	method peligrosidad() = 0
}
object cargada {
	method peso() = 300
	method peligrosidad() = 100
}
object residuos {
	var property peso = 0
	method peligrosidad() = 200
}

object embalaje {
	var property cosa = null

	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad()/2 
}

object contenedor {
	var property cosas = #{}

	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	method peligrosidad() = if (cosas.isEmpty()) 0 else cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()
}
