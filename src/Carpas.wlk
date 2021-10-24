import Marcas.*

class Carpa {
	var property personas = []
	var property limiteDeGente
	var property tieneBanda
	var property marcaDeCerveza
	
	method cantidadPersonas() = personas.size()
	method puedeIngresar(persona) = (personas.size() < limiteDeGente) and not persona.estaEbria()
	method agregarPersona(persona) {
		if(persona.puedeEntrar(self)) {
			personas.add(persona)
		} else {
			self.error("La persona no puede ingresar a la carpa")
		}
	}
	method servirJarra(persona, capacidad) { 
		if(personas.any({ p => p == persona })) {
			persona.agregarJarra(new Jarra(capacidad = capacidad, marca = marcaDeCerveza))
		} else {
			self.error("La persona no está en la carpa")
		}
	}
	
	method cantidadEbriosEmpedernidos() = personas.count({ p => p.esEbrioEmpedernido() })
}
