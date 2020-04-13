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
var newXa: Double = -2.0
var newXb: Double = 1.0

var ya: Double = -1.25
var yb: Double = 1.25
var newYa: Double = -1.25
var newYb: Double = 1.25

let Rate: Double = 0.00012
let newRate: Double = 0.0012

let StartXA: Double = -2.0
let StartXB: Double = 1.0
let StartYA: Double = -1.25
let StartYB: Double = 1.25

for x in 0..<5 {
    print("\nIteration: \(x)")

    let oldValue = String(format: "xa: %1.15f   xb: %1.15f   width: %1.15f",xa,xb,xb-xa)
    print("   Old: \(oldValue)")

    let newValue = String(format: "xa: %1.15f   xb: %1.15f   width: %1.15f",newXa,newXb,newXb-newXa)
    print("   New: \(newValue)")

    (xa,xb) = oldCalc(a: xa,b: xb, portionA: 0.5, portionB: 9.5)
    (newXa,newXb) = newCalc(a: StartXA, b: StartXB, iter: x, rate: newRate, portionA: 0.05, portionB: 0.95)
}


func oldCalc(a: Double, b: Double, portionA: Double, portionB: Double) -> (Double,Double) {
    var aReturn: Double
    var bReturn: Double

    let Width = b - a
    let Shrink = Width * 0.00012

    aReturn = a + (Shrink * 0.5)
    bReturn = b - (Shrink * 9.5)

    return (aReturn,bReturn)
}


func newCalc(a: Double, b: Double, iter: Int, rate: Double, portionA: Double, portionB: Double) -> (Double,Double) {
    var aReturn: Double
    var bReturn: Double

    let Width = b - a
    let newWidth = Width * pow((1 - (rate)),Double(iter + 1))

    let aChange = (Width - newWidth) * portionA
    let bChange = (Width - newWidth) * portionB
    aReturn = a + aChange
    bReturn = b - bChange

    return (aReturn,bReturn)
}
