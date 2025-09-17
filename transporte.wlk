object almacen {
    var property cosas = #{}

    method agregar(_cosas) {
        cosas.addAll(_cosas)
    }
}

object caminosVecinales {
    var property pesoSoportado = 2000
    method puedeTransportar(camion) {
        return camion.pesoTotal() < pesoSoportado
    }
}

object ruta9 {
    const nivel = 20
    method puedeTransportar(camion) {
        return camion.puedeCircularEnRuta(nivel)
    }
}