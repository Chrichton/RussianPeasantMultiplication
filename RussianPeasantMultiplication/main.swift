//
//  main.swift
//  RussianPeasantMultiplication
//
//  Created by Heiko Goes on 28.02.20.
//  Copyright © 2020 Heiko Goes. All rights reserved.
//

import Foundation

func getDividesOfTwo(_ number: Int) -> [Int] {
    return getDividesOfTwoRecursive(number, lastNumbers: [number])
}

func getMultplesOfTwo(number: Int, length: Int) -> [Int] {
    return (1..<length).reduce((number, [number])) { accu, _ in
        let double = 2 * accu.0
        return (double, accu.1 + [double])
    }.1
}

func getDividesOfTwoRecursive(_ number: Int, lastNumbers: [Int]) -> [Int] {
    let result = number / 2
    
    if result == 1 {
        return lastNumbers + [1]
    }
    
    return getDividesOfTwoRecursive(result, lastNumbers: lastNumbers + [result])
}

func multiply(_ arg1: Int, _ arg2: Int) -> Int {
    let divides = getDividesOfTwo(arg1)
    let tuples = zip(divides, getMultplesOfTwo(number: arg2, length: divides.count))
    return tuples
        .filter{ $0.0 % 2 != 0 }
        .map{ $0.1 }
        .reduce(0, +)
}

print(multiply(27, 82))
