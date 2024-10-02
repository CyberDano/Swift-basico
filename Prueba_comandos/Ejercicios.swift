import Foundation
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
/*
 Ejercicio 3: Ejercicio 1 con métodos
 */
func AverageWithMethod() {
    var lista = [Float] ()
    print("Vamos a hacer una media entre cinco valores")
    for n in 0...4 {
        while lista.count <= n {
            print("Dime el valor " + String(n+1) + ":")
            let number = readLine()!
            if NumberFormat(input: number) {
                lista.append(Float(number)!)
            }
        }
    }
    AverageResult(lista: lista)
}

func AverageResult(lista : Array<Float>) {
    let result = Float((lista[0] + lista[1] + lista[2] + lista[3] + lista[4])/5)
    print("La media de estos números es: " + String(result))
}

func NumberFormat(input: String) -> Bool {
    if input.isEmpty {
        print("Valor no introducido.")
        return false
    } else {
        if input.contains(",") {
            print("Formato decimal no válido. Prueba otra vez.")
            return false
        } else {
            for n in input {
                if n.isLetter || n.isSymbol {
                    print("No acepto ni letras ni símbolos. Prueba otra vez.")
                    return false
                } else {
                    return true
                }
            }
        }
    }
    return true
}

/*
 Ejercicio 4: Pedir una frase y censurar palabras clave
 */
func CensoredWords() {
    print("Escribe algo:")
    let sentence = readLine()!
    if !sentence.isEmpty {
        Validator(text: sentence)
    }
}
// Censura palabras y modifica la frase
func Validator(text: String) {
    var words = text.components(separatedBy: " ")
    for w in 0...words.count-1 {
        var palabra = words[w]
        let n: Character = palabra[palabra.startIndex]
        if ContainsLetter(word: n) {
            var corrected = ""
            corrected += String(palabra[palabra.startIndex])
            for _ in 1...palabra.count-1 {
                corrected += "*"
            }
            words[w] = corrected
        }
    }
    var censored = ""
    for w in 0...words.count-1 {
        censored += words[w]
        if w < words.count-1 {
            censored += " "
        } else {
            censored += "."
        }
    }
    print("He modificado el contenido.")
    print("La frase ahora es: " + censored)
}
// Comprueba si hay palabras sospechosas
func ContainsLetter(word: Character) -> Bool {
    if word == "J" || word == "j" {
        print("Hay una palabra sospechosa.")
        return true
    } else if word == "P" || word == "p" {
        print("Hay una palabra sospechosa.")
        return true
    } else if word == "M" || word == "m" {
        print("Hay una palabra sospechosa.")
        return true
    } else {
        return false
    }
}
/*
 Ejercicio 5: Traductor de números romanos a decimal sin restas
 */
func RomanicInts() {
    let numbers = [
        1: "I", 2: "II", 3: "III", 4: "IV", 5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX", 10: "X",
        50: "L", 100: "C", 500: "D", 1000: "M"
    ]
    print("Escribe un número romano y te diré cuánto vale:")
    var input = readLine()!
    if !input.isEmpty {
        input = input.uppercased()
        for i in numbers {
            if input == i.value {
                print("Tu número, en decimal, sería " + String(i.key) + ".")
                break
            }
            else {
                print("No parece que sea un número romano sencillo. Prueba otra vez.")
                RomanicInts()
            }
        }
    } else {
        print("Escribe un número.")
        RomanicInts()
    }
}
/*
 Ejercicio 6: Traductor de números romanos a decimal con restas
 */
func RomanicTranslate() {
    let numbers = [
        1: "I", 2: "II", 3: "III", 4: "IV", 5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX", 10: "X",
        50: "L", 100: "C", 500: "D", 1000: "M"
    ]
}

