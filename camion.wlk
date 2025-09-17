import cosas.*

object camion {
	var property cosas = #{}
	const maximo = 2500
	const tara = 1000
		
	method validarCargar(cosa) {
		if (cosas.contains(cosa)) {
			self.error("No se puede cargar " + cosa + " porque ya estaba cargada")
		}
	}

	method cargar(cosa) {
		self.validarCargar(cosa)
		cosas.add(cosa)
	}
	
	method validarDescargar(cosa) {
		if (not cosas.contains(cosa)) {
			self.error("No se puede descargar " + cosa + " porque no estaba cargada")
		}
	}

	method descargar(cosa){
		self.validarDescargar(cosa)
		cosas.remove(cosa)
	}
	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().even()})
	}
	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa=>cosa.peso() == peso})
	}
	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.peligrosidad() == nivel})
	}
	method pesoTotal() {
		return tara + cosas.sum({cosa=> cosa.peso()})
	}
	method excedidoDePeso() {
		return self.pesoTotal() > maximo
	}
	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.peligrosidad() > nivel})
	}
	
	method hayObjetosQueSuperanPeligrosidad(nivel) {
		return cosas.any({cosa => cosa.peligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	}
	method puedeCircularEnRuta(nivel) {
		return not self.excedidoDePeso() and not self.hayObjetosQueSuperanPeligrosidad(nivel)
	} 
	method tieneAlgoEntre(min,max) {
		return cosas.any({cosa => cosa.peso().between(min, max)})
	}
	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}
	method bultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}

	method accidente() {
		cosas.forEach({cosa => cosa.accidente()})
	}

	method validarTransportar(camino, destino) {
		if (not camino.puedeTransportar(self)) {
			self.error("No se puede transportar por " + camino)
		}
	}
	method transportar(camino, destino) {
		self.validarTransportar(camino, destino)
		destino.agregar(cosas)
		cosas.clear()
		
	}
}
