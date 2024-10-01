//  Ejercicios.swift
//  Prueba_comandos
//
//  Created by Leonid Daniel Gómez Gómez on 25/09/2024.

/*
 Ejercicio 1: hacer media de cinco números
 */
func Average() {
    var lista = [Float] ()
    print("Vamos a hacer una media entre cinco valores")
    for n in 0...4 {
        while lista.count <= n {
            print("Dime el valor " + String(n+1) + ":")
            let number = readLine()!
            if number.isEmpty {
                print("Valor no introducido.")
            } else {
                if number.contains(",") {
                    print("Formato decimal no válido. Prueba otra vez.")
                } else {
                    for n in number {
                        if n.isLetter || n.isSymbol {
                            print("No acepto ni letras ni símbolos. Prueba otra vez.")
                            break
                        } else {
                            lista.append(Float(number)!)
                        }
                    }
                }
            }
        }
    }
    let result = Float((lista[0] + lista[1] + lista[2] + lista[3] + lista[4])/5)
    print("La media de estos números es: " + String(result))
}
/*
 Ejercicio 2: Juego de la ruleta rusa
 */
func Roulet() {
    print("Vamos a jugar a la ruleta rusa.")
    var colt = [Int] ()
    for i in Range(1...6) {
        colt.append(i)
    }
    while colt.count >= 1 {
        var playerInt = 0
        // Jugador
        while playerInt == 0 {
            print("Selecciona una posición del tambor.")
            print("Números disponibles:", colt)
            let player_number = readLine()!
            if Correct(number: player_number) {
                if Int(player_number)! > colt.count {
                    print("Posición del tambor no disponible.")
                } else {
                    playerInt = Int(player_number)!
                }
            }
        }
        let bullet = Int.random(in: 1...colt.count) // posición de la bala
        let cpu = Int.random(in: 1...colt.count) // Jugador 2
        //Condicionales
        //var playerDead = false
        print("Has decidido usar el hueco", playerInt)
        if playerInt == bullet {
            print("-Resultado: te has disparado.")
            print("El jugador 2 ha salido vivo.")
            break
        }
        else {
            print("-Resultado: espacio vacío.")
            colt.remove(at: colt.count-1)
        }
        if colt.count == 1 /* && !playerDead*/ {
            print("Has salido vivo.")
            break
        }
        //Condicionales CPU
        print("El jugador 2 ha usado el hueco", cpu)
        if cpu == bullet {
            print("-Resultado: le han disparado.")
            print("Has salido vivo.")
            break
        }
        else {
            print("-Resultado: espacio vacío.")
            colt.remove(at: colt.count-1)
        }
    }
}
func Correct(number: String) -> Bool {
    if number.isEmpty {
        print("Valor no introducido.")
    } else {
        if number.contains(",") || number.contains(".") {
            print("Solo enteros. Prueba otra vez.")
        } else {
            for n in number {
                if n.isLetter || n.isSymbol {
                    print("No acepto ni letras ni símbolos. Prueba otra vez.")
                } else {
                    return true
                }
            }
        }
    }
    return true
}
