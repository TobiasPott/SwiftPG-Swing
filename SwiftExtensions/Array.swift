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
