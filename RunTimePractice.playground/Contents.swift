import Foundation

func executionTime(block measuredMethod: () -> ()) -> TimeInterval {
    let startTime = Date()
    measuredMethod()
    let timeDifference = startTime.timeIntervalSinceNow
    let execTime = timeDifference * -1000
    print("Execution time is \(execTime)")
    return execTime
}

// FUNCTIONS

let char: Character = "Ш"
let chars: [Character] = ["o", "a", "л"]
let text = """
Што й па мору, Што й па мору
Што й па мору, мору сіняму
Што й па мору, мору сіняму

Там плавала, Там плавала
Там плавала стада Белых лебядзей
Там плавала стада Белых лебядзей
"""
// O(n)
func findNumsOfRepetitions(in string: String, searchChar: Character) -> Int {
    var sum = 0
    
    for character in string {
        if character == searchChar {
            sum += 1
        }
    }
    return sum
}

//O(n*m)
func findNumsOfRepetitionV1(in string: String, searchChars: [Character]) -> [Int] {
    var sums: [Int] = Array(repeating: 0, count: searchChars.count)
    for sChar in string {
        for (index, character) in searchChars.enumerated() {
            if sChar == character {
                sums[index] += 1
            }
        }
    }
    return sums
}

//O(n+m)
func findNumsOfRepetitionV2(in string: String, searchChars: [Character]) -> [Int] {
    var sums: [Int] = Array(repeating: 0, count: searchChars.count)
    var charDict = [Character: Int]()
    
    for char in string {
        if !charDict.keys.contains(char) {
            charDict[char] = 1
        } else {
            charDict[char]! += 1
        }
    }
    
    for (index, char) in searchChars.enumerated() {
        if !charDict.keys.contains(char) {
            sums[index] = 0
        } else {
            sums[index] = charDict[char]!
        }
    }
    
    return sums
}
let funcTime = executionTime {
    _ = findNumsOfRepetitions(in: text, searchChar: char)
}

let funcV1Time = executionTime {
    _ = findNumsOfRepetitionV1(in: text, searchChars: chars)
}

let funcV2Time = executionTime {
    _ = findNumsOfRepetitionV2(in: text, searchChars: chars)
}
