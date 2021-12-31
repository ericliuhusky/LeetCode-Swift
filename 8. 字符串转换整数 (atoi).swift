class Solution {
    func myAtoi(_ s: String) -> Int {
        var automation = Automaton()
        for c in s {
            automation.get(c)
            if automation.isEnded {
                break
            }
        }
        return automation.isPositive ? automation.answer : -automation.answer
    }
}

struct Automaton {
    enum State {
        case start
        case signed
        case inNumber
        case end
    }
    
    var state: State = .start
    var answer = 0
    var isPositive = true
    
    var isEnded = false
    
    var table: [State: [CharacterType: State]] = [
        .start: [
            .whiteSpace: .start,
            .sign: .signed,
            .number: .inNumber,
            .unknown: .end
        ],
        .signed: [
            .whiteSpace: .end,
            .sign: .end,
            .number: .inNumber,
            .unknown: .end
        ],
        .inNumber: [
            .whiteSpace: .end,
            .sign: .end,
            .number: .inNumber,
            .unknown: .end
        ],
        .end: [
            .whiteSpace: .end,
            .sign: .end,
            .number: .end,
            .unknown: .end
        ]
    ]
    
    enum CharacterType {
        case whiteSpace
        case sign
        case number
        case unknown
    }
    
    func getType(of c: Character) -> CharacterType {
        switch c {
        case let c where c == " ":
            return .whiteSpace
        case let c where c == "-" || c == "+":
            return .sign
        case let c where c.isNumber:
            return .number
        default:
            return .unknown
        }
    }
    
    mutating func get(_ c: Character) {
        state = table[state]![getType(of: c)]!
        switch state {
        case .start:
            break
        case .signed:
            isPositive = c == "+"
        case .inNumber:
            answer = answer * 10 + Int(String(c))!
            if isPositive {
                answer = min(answer, Int(Int32.max))
            } else {
                answer = min(answer, -Int(Int32.min))
            }
        case .end:
            isEnded = true
        }
    }
}
