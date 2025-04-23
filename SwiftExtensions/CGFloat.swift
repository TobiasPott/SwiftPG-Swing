import SwiftUI

extension CGFloat {
    
    static func +(lh: CGFloat, rh: Int) -> CGFloat { return lh + CGFloat(rh) }
    static func +(lh: Int, rh: CGFloat) -> CGFloat { return rh + lh }
    
    static func -(lh: CGFloat, rh: Int) -> CGFloat { return lh - CGFloat(rh) }
    static func -(lh: Int, rh: CGFloat) -> CGFloat { return CGFloat(lh) - rh }
    
    static func *(lh: CGFloat, rh: Int) -> CGFloat { return lh * CGFloat(rh) }
    static func *(lh: Int, rh: CGFloat) -> CGFloat { return rh * lh }
    
    static func /(lh: CGFloat, rh: Int) -> CGFloat { return lh / CGFloat(rh) }
    static func /(lh: Int, rh: CGFloat) -> CGFloat { return CGFloat(lh) / rh }
 
    func clamp(_ low: Self, _ high: Self) -> Self {
        return CGFloat.maximum(low, CGFloat.minimum(self, high))
    }
    static func clamp(_ value: Self, _ low: Self, _ high: Self) -> Self {
        return CGFloat.maximum(low, CGFloat.minimum(value, high))
    }
    
    func remap(iLow: Self, iHigh: Self, oLow: Self, oHigh: Self) -> Self {
        return oLow + (self - iLow) * (oHigh - oLow) / (iHigh - iLow) 
    }
    
    /*
     float map(float s, float a1, float a2, float b1, float b2)
     {
     return b1 + (s-a1)*(b2-b1)/(a2-a1);
     }
    */
//  float Remap (this float value, float from1, float to1, float from2, float to2) {
//        return (value - from1) / (to1 - from1) * (to2 - from2) + from2;

}


extension Int {
    static func maximum(_ lh: Self, _ rh: Self) -> Self { return lh < rh ? rh : lh }
    static func minimum(_ lh: Self, _ rh: Self) -> Self { return lh > rh ? rh : lh }
    
    func clamp(_ low: Self, _ high: Self) -> Self {
        return Int.maximum(low, Int.minimum(self, high))
    }
    static func clamp(_ value: Self, _ low: Self, _ high: Self) -> Self {
        return Int.maximum(low, Int.minimum(value, high))
    }
    
    func remap(iLow: Self, iHigh: Self, oLow: Self, oHigh: Self) -> Self {
        return oLow + (self - iLow) * (oHigh - oLow) / (iHigh - iLow) 
    }
    
}
