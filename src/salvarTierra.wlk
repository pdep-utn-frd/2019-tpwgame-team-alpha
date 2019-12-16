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
		game.say(explosion,"Presiona Espacio para jugar nuevamente")
	}
	
    method cambioDeImagen(unaOrientacion) { 
	  	orientacion = unaOrientacion 
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

object juego{
    method inicio(){
    	game.clear()
		game.width(25)
		game.height(10)
		game.title("Save the Earth")
		game.boardGround("espacio1.png")
		keyboard.space().onPressDo({self.inicio()})
		self.desplegarObjetos()
	
    }
	
	method desplegarObjetos(){
		game.addVisual(base)
		game.addVisualCharacter(misil)
		game.addVisual(alien)
		game.say(base,"Destrui el Alien y salva a la Tierra !!")
		self.movimientos()

	}

	method movimientos(){
		keyboard.up().onPressDo({misil.cambioDeImagen(arriba)})
		keyboard.down().onPressDo({misil.cambioDeImagen(abajo)})
		keyboard.left().onPressDo({misil.cambioDeImagen(izquierda)})
		keyboard.right().onPressDo({misil.cambioDeImagen(derecha)})
    	keyboard.space().onPressDo({self.inicio()})
	
	//movimiento maquina
		game.onTick(1500,"alien",{alien.mover()})
		game.whenCollideDo(alien , {alien => alien.destruccion()} ) 
	}
}
