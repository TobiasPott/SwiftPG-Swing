import SwiftUI

extension Color {
    
    static let fuchsia: Color = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.5, opacity: 1.0)
    
    func mix(with color: Color, by percentage: Double, noAlpha: Bool = false) -> Color {
        let pct = min(max(percentage, 0), 1)
        
        let cmpLh = UIColor(self).cgColor.components!
        let cmpRh = UIColor(color).cgColor.components!
        
        let red = (1.0 - pct) * cmpLh[0] + pct * cmpRh[0]
        let green = (1.0 - pct) * cmpLh[1] + pct * cmpRh[1]
        let blue = (1.0 - pct) * cmpLh[2] + pct * cmpRh[2]
        let alpha = noAlpha ? cmpLh[3] : (1.0 - pct) * cmpLh[3] + pct * cmpRh[3]
        
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
