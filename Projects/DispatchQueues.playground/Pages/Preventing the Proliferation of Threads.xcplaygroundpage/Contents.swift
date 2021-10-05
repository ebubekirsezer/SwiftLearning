
import Dispatch

func trace(queue: String, task: Int = 0) {
    print("Queue \(queue) started task \(task)")
    sleep(UInt32.random(in: 0...2))
    print("Queue \(queue) completed task \(task)")
}

let targetQueue = DispatchQueue(label: "com.ebubekirsezer.target", attributes: .concurrent)

let serialQueue1 = DispatchQueue(label: "com.ebubekirsezer.serial1", target: targetQueue)
let serialQueue2 = DispatchQueue(label: "com.ebubekirsezer.serial2", target: targetQueue)
let serialQueue3 = DispatchQueue(label: "com.ebubekirsezer.serial3", target: targetQueue)

let serialQueues = [serialQueue1, serialQueue2, serialQueue3]

for queue in serialQueues {
    queue.sync {
        trace(queue: queue.label)
    }
}

print("\nSerial queue with the concurrent queue set as target")
for i in 0...3 {
    serialQueue1.async {
        trace(queue: serialQueue1.label, task: i)
    }
}
