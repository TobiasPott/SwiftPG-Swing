import SwiftUI

extension Array {
    mutating func bubbleSort(by: (_ lh: Array.Element, _ rh: Array.Element) -> Bool) {
        for sI in 0..<self.count-1 {
            for sIRev in 0..<self.count-sI-1 {
                let ilh = sIRev, irh = sIRev + 1
                if by(self[ilh], self[irh]) { 
                    self.swapAt(ilh, irh)
                }
            }            
        }
    }
}

extension Array where Element: BinaryFloatingPoint {
    static func +=(lhs: inout Array, rhs: Element) {
        for i in 0..<lhs.count { lhs[i] = lhs[i] + rhs }
    }
    static func -=(lhs: inout Array, rhs: Element) {
        for i in 0..<lhs.count { lhs[i] = lhs[i] - rhs }
    }
    static func *=(lhs: inout Array, rhs: Element) {
        for i in 0..<lhs.count { lhs[i] = lhs[i] * rhs }
    }
    static func /=(lhs: inout Array, rhs: Element) {
        for i in 0..<lhs.count { lhs[i] = lhs[i] / rhs }
    }
    
    func greater(_ than: Element) -> Bool {
        for el in self {
            if el <= than { return false }
        }
        return true
    }
    func less(_ than: Element) -> Bool {
        for el in self {
            if el >= than { return false }
        }
        return true
    }
}

