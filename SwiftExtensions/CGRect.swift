import SwiftUI
import Foundation

extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) { self.init(x: x, y: y, width: w, height: h) }

    /*
    var tl: CGPoint { get { .init(x: minX, y: minY)}}
    var tr: CGPoint { get { .init(x: maxX, y: minY)}}
    var br: CGPoint { get { .init(x: maxX, y: maxY)}}
    var bl: CGPoint { get { .init(x: minX, y: maxY)}}
    */
    func normalized(size: CGSize) -> CGRect {
        return CGRect(x: self.minX / size.width, y: self.minY / size.height, width: self.width / size.width, height: self.height / size.height)
    }
    
    /*
     static func +(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x + rh.x, y: lh.y + rh.y) }
     static func -(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x - rh.x, y: lh.y - rh.y) }
     static func *(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x * rh.x, y: lh.y * rh.y) }
     static func /(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x / rh.x, y: lh.y / rh.y) }
     */
    
    // === Operators CGRect/CGPoint ===
    static func +(lh: CGRect, offset: CGPoint) -> CGRect { return .init(origin: lh.origin + offset, size: lh.size) }
    static func -(lh: CGRect, offset: CGPoint) -> CGRect { return .init(origin: lh.origin - offset, size: lh.size) }
    static func *(lh: CGRect, originFactor: CGFloat) -> CGRect { return .init(origin: lh.origin * originFactor, size: lh.size) }
    static func /(lh: CGRect, originFactor: CGFloat) -> CGRect { return .init(origin: lh.origin / originFactor, size: lh.size) }
    
    
    static func slice(x: Int, y: Int) -> [CGRect] {
        let sW: CGFloat = 1.0 / x 
        let sH: CGFloat = 1.0 / y
        var results: [CGRect] = []
        for iY in 0..<y {
            for iX in 0..<x {
                let rect = CGRect(x: iX * sW, y: iY * sH, width: sW, height: sH)
                results.append(rect)
            }
        }
        return results
    }
}
