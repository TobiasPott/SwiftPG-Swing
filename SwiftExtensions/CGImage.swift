import SwiftUI

extension CGImage {
    var aspect: CGFloat { get { return CGFloat(width) / CGFloat(height) } }
    
    func getPixelsRGBA() -> [Int] {
        if let pixelData: [UInt8] = getPixels() {
            var result: [Int] = []
            for i in 0..<pixelData.count / 4 {
                var rgba: Int = 0
                rgba += Int(pixelData[i*4+0]) << 24
                rgba += Int(pixelData[i*4+1]) << 16
                rgba += Int(pixelData[i*4+2]) << 8
                rgba += Int(pixelData[i*4+3])
                result.append(rgba)
            }
            return result
        }
        return []
    }
    func getPixels() -> [UInt8]? {
        let size = CGSize(width: self.width, height: self.height)
        let dataSize = size.width * size.height * 4
        var pixelData = [UInt8](repeating: 0, count: Int(dataSize))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: &pixelData,
                                width: Int(size.width),
                                height: Int(size.height),
                                bitsPerComponent: 8,
                                bytesPerRow: 4 * Int(size.width),
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
        
        // rotate and scale to have columns inline
        context?.rotate(by: 90 * CGFloat.pi / 180.0)
        context?.scaleBy(x: -1, y: 1)
        context?.draw(self, in: CGRect(x: -size.width, y: -size.height, width: size.width, height: size.height))        
        
        return pixelData
    }
}

