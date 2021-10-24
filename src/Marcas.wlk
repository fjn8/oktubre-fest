class Cerveza {
	const property cantidadDeLupulo
	const property paisDeFabricacion
}

class CervezaRubia inherits Cerveza {
	const property graduacion
}

class CervezaNegra inherits Cerveza {
	method graduacion() = graduacionReglamentaria.graduacion().min(cantidadDeLupulo * 2)
}

class CervezaRoja inherits CervezaNegra {
	override method graduacion() = super() * 1.25
}

object graduacionReglamentaria {
	var property graduacion = 4
}

class Jarra {
	var property capacidad // 1
	var property marca // holfbrau 12 de lupulo
	
	method contenidoDeAlcohol() = marca.graduacion() * capacidad / 100
}