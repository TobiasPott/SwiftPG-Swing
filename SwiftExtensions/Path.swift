import SwiftUI

extension Path {
    mutating func move(_ toX: CGFloat, _ toY: CGFloat) { self.move(to: .init(toX, toY)) }
    mutating func addLine(_ toX: CGFloat, _ toY: CGFloat) { self.addLine(to: .init(toX, toY)) }
}
