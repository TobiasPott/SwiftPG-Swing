import SwiftUI

extension Path {
    mutating func move(_ toX: CGFloat, _ toY: CGFloat) { self.move(to: .init(toX, toY)) }
    mutating func addLine(_ toX: CGFloat, _ toY: CGFloat) { self.addLine(to: .init(toX, toY)) }
    
    mutating func move2i(to: CGPoint) { self.move(to: .init(CGFloat(Int(to.x)),
                                                            CGFloat(Int(to.y)))) }
    mutating func addLine2i(to: CGPoint) { self.addLine(to: .init(CGFloat(Int(to.x)), 
                                                                  CGFloat(Int(to.y)))) }
}
