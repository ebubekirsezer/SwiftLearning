
import Dispatch

let globalQueue = DispatchQueue.global(qos: .userInitiated)

func trace(task: Int) {
    print("Task \(task) started")
    sleep(UInt32.random(in: 0...2))
    print("Task \(task) completed")
}

//print("Concurrent queue, synchronous execution")
//
//for i in 1...5 {
//    print("Submitting task \(i)")
//    globalQueue.sync {
//        trace(task: i)
//    }
//}
//
//print("Concurrent queue, asynchronous execution")
//
//for i in 1...5 {
//    print("Submitting task \(i)")
//    globalQueue.async {
//        trace(task: i)
//    }
//}

//let serialQueue = DispatchQueue(label: "com.ebubekirsezer.serial")
//
//print("Serial queue, sycnhornous execution")
//
//for i in 1...5 {
//    print("Submitting task \(i)")
//    serialQueue.sync {
//        trace(task: i)
//    }
//}
//
//print("Serial queue, asycnhornous execution")
//
//for i in 1...5 {
//    print("Submitting task \(i)")
//    serialQueue.async {
//        trace(task: i)
//    }
//}

//let workItem = DispatchWorkItem {
//    print("Hey, I'm a work item!")
//}
//
//workItem.cancel()
//globalQueue.async(execute: workItem)
//print("Done")
//workItem.perform()

//var workItems = [DispatchWorkItem]()
//
//for i in 1...5 {
//    let workItem = DispatchWorkItem {
//        print("Work item \(i) started")
//        
//        sleep(UInt32.random(in: 0...1))
//        
//        guard workItems[i-1].isCancelled == false else {
//            print("Work item \(i) cancelled")
//            return
//        }
//        
//        sleep(UInt32.random(in: 0...2))
//        print("Work item \(i) completede")
//    }
//    
//    workItems.append(workItem)
//    
//    print("Submitting work item \(i)")
//    globalQueue.async(execute: workItem)
//}
//
//print("Cancelling all workitems")
//workItems.forEach( { $0.cancel() })


let workerItem = DispatchWorkItem {
    print("Work item started")
    sleep(UInt32.random(in: 0...2))
    print("Work item completed")
}

let uiItem = DispatchWorkItem {
    print("Updateing the UI")
}

globalQueue.async(execute: workerItem)
workerItem.notify(queue: .main, execute: uiItem)
