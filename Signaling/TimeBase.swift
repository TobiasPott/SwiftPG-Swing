import SwiftUI

class TimeBase: ObservableObject {
    static let GLOBAL: TimeBase = GameTime(30, false)
    
    static let MAX: Double = Double(Int.max)
    static let MAXINT: Int = Int.max
    
    static var allPaused: Bool = false
    // ToDo: add Package.swift to Swing and MoGL.GL submodules to prep for package manager switch
    
    var interval: Double = 1.0 / 20.0
    @Published var isPaused: Bool = false
    @Published var time = 0.0
    @Published var frame: Int = 0
    
    let tick: Event<TimeBase> = Event<TimeBase>()
    
    func update(_ t: TimeBase) {
        if !isPaused && !TimeBase.allPaused {
            time += interval
            frame += 1
            if time >= TimeBase.MAX || frame >= TimeBase.MAXINT {
                time = 0; frame = 0
            }
        }
    }
    func reset(_ paused: Bool = false) {
        isPaused = paused
        time = 0.0
        frame = 0
    }
    
    public func onTick() {
        if isPaused || TimeBase.allPaused { return }
        tick.invoke(data: self)
    }
}
