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
let text = """
Што й па мору, Што й па мору
Што й па мору, мору сіняму
Што й па мору, мору сіняму

Там плавала, Там плавала
Там плавала стада Белых лебядзей
Там плавала стада Белых лебядзей
"""

func findNumsOfRepetitions(in string: String, searchChar: Character) -> Int {
    var sum = 0
    
    for character in string {
        if character == searchChar {
            sum += 1
        }
    }
    return sum
}

func findNumsOfRepetitionV2(in string: String, searchChars: [Character]) -> [Int] {
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

let funcV1Time = executionTime {
    _ = findNumsOfRepetitions(in: text, searchChar: char)
}

let funcV2Time = executionTime {
    _ = findNumsOfRepetitionV2(in: text, searchChars: ["o", "a", "л"])
}
