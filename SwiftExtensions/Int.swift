import SwiftUI

extension Int {
    init(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ a: UInt8 = 255) {
        var val = 0
        val += Int(r) << 24
        val += Int(g) << 16
        val += Int(b) << 8
        val += Int(a)
        self = val
    }
    
    func unpackRGBA() -> UIColor {
        let r: CGFloat = (CGFloat(self & 0x000000FF) / 255.0)
        let g: CGFloat = 1.0
        let b: CGFloat = 1.0
        let a: CGFloat = 1.0
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    // ToDo: convert mix to mix packed integer with each other
    //    func mix(with color: Color, by percentage: Double, noAlpha: Bool = false) -> Color {
    //        let pct = min(max(percentage, 0), 1)
    //        
    //        let cmpLh = UIColor(self).cgColor.components!
    //        let cmpRh = UIColor(color).cgColor.components!
    //        
    //        let red = (1.0 - pct) * cmpLh[0] + pct * cmpRh[0]
    //        let green = (1.0 - pct) * cmpLh[1] + pct * cmpRh[1]
    //        let blue = (1.0 - pct) * cmpLh[2] + pct * cmpRh[2]
    //        let alpha = noAlpha ? cmpLh[3] : (1.0 - pct) * cmpLh[3] + pct * cmpRh[3]
    //        
    //        return Color(red: red, green: green, blue: blue, opacity: alpha)
    //    }
    
}
