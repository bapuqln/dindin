/*
Given a string str consisting of letters only and an integer n, the task is to replace every character of the given string by a character which is n times more than it. If the letter exceeds ‘z’, then start checking from ‘a’ in a cyclic manner.

Examples:
Input: str = “abc”, n = 2
Output: cde
a is moved by 2 times which results in character c
b is moved by 2 times which results in character d
c is moved by 2 times which results in character e

Input: str = “abc”, n= 28
Output: cde
a is moved 25 times, z is reached. Then the 26th character will be a, 27th b and 28th c.
b is moved 24 times, z is reached. 28-th is d.
c is moved 23 times, z is reached. 28-th is f.

Question:
a/ Write an algorithm to solve the above issue. Please consider the complexity of the algorithm.
b/ What is the disadvantage of using the ASCII value of the letters to solve this problem?
*/

import Foundation

extension String {
    public var ascii: Int {
        return Int(unicodeScalars.first?.value ?? 0)
    }
}

extension Character {
   var ascii: Int {
       get {
           return Int(self.unicodeScalars.first?.value ?? 0)
       }
    }
}

extension Int {
    static let ascii_a = "a".ascii
    static let ascii_z = "z".ascii
    static let ascii_A = "A".ascii
    static let ascii_Z = "Z".ascii
    
    var ascii: Character {
        get {return Character(UnicodeScalar(self)!)}
    }
}

struct Solution {
    func solve(_ input: String, value: Int) -> String {
        if value < 0 || input.count == 0 {
            return input
        }
        
        let mod = value % 26
        var ans = ""
        
        input.enumerated().forEach { (eachElem) in
            let asc = eachElem.element.ascii
            if asc + mod > Int.ascii_z {
                ans.append((Int.ascii_a + Int.ascii_z - asc).ascii)
            } else {
                ans.append((asc + mod).ascii)
            }
        }
        return ans
    } // Time Complexity will be O(N)
}


let input: [(String, Int)] = [
    ("abcz", -1),
    ("abcz", 0),
    ("abcz", 1),
    ("abc", 28),
    ("abcz", 100000000),
    ("abcy", 100000000),
    ("abcdefajklasdjfkljgkjksdjfkez", Int.max),
    ("abcdefajklasdjfkljgkjksdjfkez", Int.min),
]

let sol = Solution()

for pair in input {
    let ans = sol.solve(pair.0, value: pair.1)
    print("Case # \(pair.0) : \(pair.1) = \(ans)")
}
