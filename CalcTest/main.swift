//
//  main.swift
//  CalcTest
//
//  Created by mikey on 4/13/20.
//  Copyright © 2020 Sand Creek Software. All rights reserved.
//

import Foundation

print("Hello, World!")

var xa: Double = -2.0
var xb: Double = 1.0

var ya: Double = -1.25
var yb: Double = 1.25
var newYa: Double = -1.25
var newYb: Double = 1.25

let Rate: Double = 0.00012
let StartXA: Double = -2.0
let StartXB: Double = 1.0
let StartYA: Double = -1.25
let StartYB: Double = 1.25

for x in 0..<5 {
    print("\nIteration: \(x)")

    let oldValue = String(format: "ya: %1.15f   yb: %1.15f   width: %1.15f",ya,yb,yb-ya)
    print("   Old: \(oldValue)")

    let newValue = String(format: "ya: %1.15f   yb: %1.15f   width: %1.15f",newYa,newYb,newYb-newYa)
    print("   New: \(newValue)")

    (ya,yb) = oldCalc(a: ya,b: yb)
    (newYa,newYb) = newCalc(a: StartYA, b: StartYB, i: x, rate: Rate)
}


func oldCalc(a: Double, b: Double) -> (Double,Double) {
    var aReturn: Double
    var bReturn: Double

    let Width = b - a
    let Shrink = Width * 0.00012

    aReturn = a + (Shrink * 5)
    bReturn = b - (Shrink * 5)

    return (aReturn,bReturn)
}


func newCalc(a: Double, b: Double, i: Int, rate: Double) -> (Double,Double) {
    var aReturn: Double
    var bReturn: Double

    let Width = b - a
    let newWidth = Width * pow((1 - (rate * 10)),Double(i + 1))

    aReturn = -newWidth / 2
    bReturn = newWidth / 2

    return (aReturn,bReturn)
}
