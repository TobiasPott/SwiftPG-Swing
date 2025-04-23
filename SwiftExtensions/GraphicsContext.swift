import SwiftUI

extension GraphicsContext {
    func point(at: CGPoint, with: Shading, size: CGFloat = 8.0) {
        let halfSize: CGFloat = size / 2.0
        let origin: CGPoint = .init(x: at.x - halfSize, y: at.y - halfSize)
        self.fill(Path(CGRect(origin: origin, size: CGSize(width: size, height: size))), with: with)
    }
}

extension GraphicsContext.Shading {
    static func verticalGradient(_ colors: [Color], _ startPoint: CGPoint, _ endPoint: CGPoint, _ options: GraphicsContext.GradientOptions) -> GraphicsContext.Shading {
        return GraphicsContext.Shading.linearGradient(Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint, options: options)
    }
    static func verticalGradient2(_ colors: [Color], _ startPoint: CGPoint, _ endPoint: CGPoint, _ options: GraphicsContext.GradientOptions) -> GraphicsContext.Shading {
        var stops: [Gradient.Stop] = [.init(color: colors[0], location: 0.0)]
        let sDelta = 1.0 / colors.count
        for i in 0..<colors.count-1 {
            stops.append(.init(color: colors[i], location: sDelta * (i+1)))
            stops.append(.init(color: colors[i+1], location: sDelta * (i+1) + 0.001))
        }
//        stops.append(.init(color: colors[colors.count-1], location: 1.0))
        
        return GraphicsContext.Shading.linearGradient(Gradient(stops: stops), startPoint: startPoint, endPoint: endPoint, options: options)
    }
}
