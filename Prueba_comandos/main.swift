print("¿Cómo te llamas?")
var name = readLine()! // El ! fuerza a ser String
// readLine() es como input() de Python
var incorrecto = false
repeat {
    if name.count > 10 {
        print("Error: nombre demasiado largo")
        incorrecto = true
        name = readLine()!
    } else if name.first!.isNumber {
        print("Error: No puede empezar por un número")
        incorrecto = true
        name = readLine()!
    } else {
        incorrecto = false
    
    }
} while incorrecto
print("Hola", name)
