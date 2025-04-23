import SwiftUI

struct EventHandler<T> {    
    typealias Action = (T) -> Void
    let id: String
    let handle: Action 
}

class Event<T> {
    typealias Handler = (T) -> Void
    
    let allowReplace: Bool
    private var eventHandlers: [String:Handler] = [:]
    
    convenience init() { self.init(true) }
    init(_ allowReplace: Bool) {
        self.allowReplace = allowReplace
    }
    
    func add(_ action: EventHandler<T>) { eventHandlers[action.id] = action.handle }    
    func add(id: String, _ handler: @escaping Handler) { 
        eventHandlers[id] = handler 
    }
    func delete(_ action: EventHandler<T>) { delete(id: action.id) }    
    func delete(id: String) { eventHandlers.removeValue(forKey: id) }
    
    func invoke(data: T) {
        if eventHandlers.isEmpty { return }
        for handler in eventHandlers.values { handler(data) }
    }
    
}
