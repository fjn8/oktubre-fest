class Persona {
	var property peso
	var jarrasCompradas = []
	var property escuchaMusicaTradicional
	var property nivelDeAguante
	
	method agregarJarra(jarra) = jarrasCompradas.add(jarra)
	method alcoholIngerido() = jarrasCompradas.sum({ j  => j.contenidoDeAlcohol() })
	method estaEbria() = self.alcoholIngerido() * peso > nivelDeAguante
	method leGusta(marca)
	method quiereEntrar(carpa) = self.leGusta(carpa.marcaDeCerveza()) and (escuchaMusicaTradicional == carpa.tieneBanda())
	method puedeEntrar(carpa) = self.quiereEntrar(carpa) and carpa.puedeIngresar(self)
	method esEbrioEmpedernido() = jarrasCompradas.all({ j => j.capacidad() > 1 })
	method pais()
	method esPatriota() = jarrasCompradas.all({ j => j.marca().paisDeFabricacion() == self.pais() })
}

class Checo inherits Persona {
	override method leGusta(marca) = marca.graduacion() > 8
	override method pais() = "República Checa"
}

class Belga inherits Persona {
	override method leGusta(marca) = marca.cantidadDeLupulo() > 4
	override method pais() = "Bélgica"
}

class Aleman inherits Persona {
	override method leGusta(marca) = true
	override method quiereEntrar(carpa) = super(carpa) and carpa.personas().size() % 2 == 0
	override method pais() = "Alemania"
}