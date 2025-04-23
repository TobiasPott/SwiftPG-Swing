import SwiftUI

/** Implementation of TimeBase for frame counting and framerate based tick event dispatch */
class GameTime: TimeBase {
    // === Fields === 
    @Published var realTime = 0.0
    @Published var realFrame: Int = 0
    
    // === Properties === 
    private var timer: Timer = Timer()
    
    // === Ctors ===
    init(_ framesPerSecond: Double = 20, _ paused: Bool = true) {
        super.init()
        tick.add(id: "__tick", update)
        self.reset(framesPerSecond, paused)
    }
    
    // === Functions ===
    override func update(_ t: TimeBase) {
        super.update(t)
        realTime += interval
        realFrame += 1
        
        // safeguard from overflow
        if time >= TimeBase.MAX || frame >= TimeBase.MAXINT
            || realTime >= TimeBase.MAX || realFrame >= TimeBase.MAXINT {
            realTime = 0; realFrame = 0
        }
    }
    func reset(_ framesPerSecond: Double, _ paused: Bool = false) {
        interval = 1.0 / Double(framesPerSecond)
        reset(paused)
    }
    override func reset(_ paused: Bool = false) {
        super.reset(paused)
        realTime = 0.0
        realFrame = 0
        timer = Timer.scheduledTimer(withTimeInterval: interval, 
                                     repeats: true, 
                                     block: { t in self.onTick() })
    }
}
