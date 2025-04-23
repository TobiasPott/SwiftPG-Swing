import SwiftUI

class GenericStats<Key: Hashable>: ObservableObject {
    typealias Snapshot = [Key: UInt64]
    
    @Published var data: Snapshot = [:]
    @Published var last: Snapshot = [:]
    
    func get(_ key: Key) -> UInt64 { return data[key] ?? 0 }
    func incr(_ key: Key, _ amount: Int = 1) {
        data[key] = (data[key] ?? 0) + UInt64(amount)
    }
    func reset(_ key: Key) {
        data[key] = 0
    }
    func reset() {
        last = [:]
        for kv in data { last[kv.key] = kv.value }
        data.removeAll();
    }
}

struct GenericStatsView<Key: Hashable>: View {
    @ObservedObject var stats: GenericStats<Key>
    
    var filter: [Key]
    
    var body: some View {
        VStack(alignment: .trailing) {
            ForEach(filter, id: \.hashValue) { k in  
                StatisticRow(name: "\(k)", value: stats.get(k))
            }
        }
        .padding(4).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    
    struct StatisticRow: View {
        let name: String
        let value: any BinaryInteger
        
        var body: some View {
            HStack() {
                Text(name).frame(minWidth: 80, alignment: .leading)
                Text("\(value)").frame(minWidth: 24, alignment: .trailing) 
            }
        }
    }
}
