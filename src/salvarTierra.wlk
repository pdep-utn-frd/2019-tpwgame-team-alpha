import wollok.game.*

object misil{
	var property position = game.origin()
 	var orientacion = derecha
	
	method image()= orientacion.imagenDelMisil()
	
	method destruccion(){
		game.addVisual(explosion)
		game.removeVisual(self)
		game.removeVisual(alien)
		game.say(base,"Felicitaciones! Has salvado el planeta")
	}
	
    method cambioDeImagen(unaOrientacion) { 
	  	orientacion = unaOrientacion 
 		self.image()
	}
}

object arriba {
  method imagenDelMisil() = "misil-arriba.png"
}

object abajo {
  method imagenDelMisil() = "misil-abajo.png"
}

object izquierda {
  method imagenDelMisil() = "misil-izquierda.png"
}

object derecha {
  method imagenDelMisil() = "misil-derecha.png"
}

object explosion{
	var property position = alien.position()
	
	method image() = "explosion.png"
}

object base{
	var property position = game.origin()
	
	method image()="tierra.png"
}


object alien{
	var  property position = game.center()
	
	method image()="ufoo1.png"
	
	method mover(){
		var x = 0.randomUpTo(game.width() -1).truncate(0)
		var y = 0.randomUpTo(game.height() -1).truncate(0)
		position = game.at(x,y)
	}
}

