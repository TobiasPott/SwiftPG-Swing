import SwiftUI
import Foundation

extension CGSize {
    init(_ w: CGFloat, _ h: CGFloat) { self.init(width: w, height: h) }
    
    var cgPoint: CGPoint { get { return CGPoint(width, height) } }
    var aspect: CGFloat { get { return width / height } }
    
    func normalized() -> CGSize {
        var len: CGFloat = sqrt((self.width * self.width) + (self.height * self.height))
        if len == 0 { len = 1 }
        return .init(width: self.width / len, height: self.height / len)
    }
    func magnitude() -> CGFloat {
        return sqrt((self.width * self.width) + (self.height * self.height))
    }
    
    
    static func +(lh: CGSize, rh: CGSize) -> CGSize { return .init(width: lh.width + rh.width, height: lh.height + rh.height) }
    static func -(lh: CGSize, rh: CGSize) -> CGSize { return .init(width: lh.width - rh.width, height: lh.height - rh.height) }
    static func *(lh: CGSize, rh: CGSize) -> CGSize { return .init(width: lh.width * rh.width, height: lh.height * rh.height) }
    static func /(lh: CGSize, rh: CGSize) -> CGSize { return .init(width: lh.width / rh.width, height: lh.height / rh.height) }
    
    static func +(lh: CGSize, rh: CGFloat) -> CGSize { return .init(width: lh.width + rh, height: lh.height + rh) }
    static func -(lh: CGSize, rh: CGFloat) -> CGSize { return .init(width: lh.width - rh, height: lh.height - rh) }
    static func *(lh: CGSize, rh: CGFloat) -> CGSize { return .init(width: lh.width * rh, height: lh.height * rh) }
    static func /(lh: CGSize, rh: CGFloat) -> CGSize { return .init(width: lh.width / rh, height: lh.height / rh) }
    
}
