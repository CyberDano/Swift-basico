//
//  Ejercicios.swift
//  Prueba_comandos
//
//  Created by Leonid Daniel Gómez Gómez on 25/09/2024.
//
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
                print("Valor inexistente. Prueba otra vez.")
            } else {
                if number.contains(",") {
                    print("Valor decimal no válido. Prueba otra vez.")
                } else {
                    for n in number {
                        if n.isLetter || n.isSymbol {
                            print("No acepto ni letras ni símbolos. Prueba otra vez.")
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
