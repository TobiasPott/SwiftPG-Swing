import SwiftUI
import Foundation

extension CGPoint {
    init(_ x: CGFloat, _ y: CGFloat) { self.init(x: x, y: y) }
    
    var cgSize: CGSize { get { return CGSize(x, y) } }
    
    func normalized() -> CGPoint {
        var len: CGFloat = sqrt((self.x * self.x) + (self.y * self.y))
        if len == 0 { len = 1 }
        return .init(x: self.x / len, y: self.y / len)
    }
    func magnitude() -> CGFloat {
        return sqrt((self.x * self.x) + (self.y * self.y))
    }
    
    func rotate(_ angle: Int, _ origin: CGPoint) -> CGPoint { return rotate(CGFloat(angle), origin) }
    func rotate(_ angle: CGFloat, _ origin: CGPoint) -> CGPoint {
        let tmp = (self + origin)
        let c = MoGLMath.cosD(angle)
        let s = MoGLMath.sinD(angle)
        return CGPoint(x: tmp.x * c - tmp.y * s, y: tmp.x * s + tmp.y * c) - origin
    }
    func rotate(_ angle: Int, _ origin: CGPoint, _ c: CGFloat, _ s: CGFloat) -> CGPoint { return rotate(CGFloat(angle), origin, c, s) }
    func rotate(_ angle: CGFloat, _ origin: CGPoint, _ c: CGFloat, _ s: CGFloat) -> CGPoint {
        let tmp = (self + origin)
        return CGPoint(x: tmp.x * c - tmp.y * s, y: tmp.x * s + tmp.y * c) - origin
    }
    // ToDo: add scale over pivot function to allow scale around a specific pivot
    func scale(_ scale: CGPoint, _ origin: CGPoint) -> CGPoint {
        let tmp = (self + origin)
        return (tmp * scale) - origin
    }
    
    func lerp(_ to: CGPoint, _ t: CGFloat) -> CGPoint {
        return self + (to - self) * t
    }
    func angle(_ to: CGPoint) -> CGFloat {
        let angle = atan2(to.y, to.x) - atan2(self.y, self.x)
        return angle * 180.0 / .pi
    }
    func angle180(_ to: CGPoint) -> CGFloat {
        let angle = (atan2(to.y, to.x) - atan2(self.y, self.x)) * 180.0 / .pi
        
        return angle > 180 ? angle - 360 : angle
    }
    
    static func +(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x + rh.x, y: lh.y + rh.y) }
    static func -(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x - rh.x, y: lh.y - rh.y) }
    static func *(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x * rh.x, y: lh.y * rh.y) }
    static func /(lh: CGPoint, rh: CGPoint) -> CGPoint { return .init(x: lh.x / rh.x, y: lh.y / rh.y) }
    
    static func +(lh: CGPoint, rh: CGFloat) -> CGPoint { return .init(x: lh.x + rh, y: lh.y + rh) }
    static func -(lh: CGPoint, rh: CGFloat) -> CGPoint { return .init(x: lh.x - rh, y: lh.y - rh) }
    static func *(lh: CGPoint, rh: CGFloat) -> CGPoint { return .init(x: lh.x * rh, y: lh.y * rh) }
    static func /(lh: CGPoint, rh: CGFloat) -> CGPoint { return .init(x: lh.x / rh, y: lh.y / rh) }
    
    func draw(to: GraphicsContext, with: GraphicsContext.Shading, size: CGFloat = 8.0) {
        to.point(at: self, with: with, size: size)
    }
    
    static func circle(c: CGPoint, rad: CGPoint, segs: Int, rev: Bool = false) -> [CGPoint] {
        return arc(c: c, rad: rad, sA: 0, lenA: rev ? -360 : 360, segs: segs)
    }
    static func arc(c: CGPoint, rad: CGPoint, sA: CGFloat = 0, lenA: CGFloat = 360.0, segs: Int = 12) -> [CGPoint] {
        var points: [CGPoint] = []
        let segAngle: CGFloat = lenA / CGFloat(segs - 1)
        for i in (0..<segs) {
            let angle = CGFloat(i) * (segAngle) + sA
            points.append(CGPoint(x: c.x + rad.x * MoGLMath.sin(angle), 
                                  y: c.y + rad.y * MoGLMath.cos(angle)))
        }      
        return points
    }
    static func arcInt(c: CGPoint, rad: CGPoint, sA: CGFloat = 0, lenA: CGFloat = 360.0, segs: Int = 12) -> [CGPoint] {
        var points: [CGPoint] = []
        let segAngle: CGFloat = lenA / CGFloat(segs - 1)
        for i in (0..<segs) {
            let angle = CGFloat(i) * (segAngle) + sA
            points.append(CGPoint(x: Int(c.x + rad.x * MoGLMath.sin(angle)), 
                                  y: Int(c.y + rad.y * MoGLMath.cos(angle))))
        }      
        return points
    }
}



