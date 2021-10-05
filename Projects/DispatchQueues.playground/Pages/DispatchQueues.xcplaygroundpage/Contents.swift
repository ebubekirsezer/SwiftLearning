import Dispatch

// Accessing the main queue
let mainQueue = DispatchQueue.main

// Fetching a global queue with QoS .userInteractive
let highPrioGlobalQueue = DispatchQueue.global(qos: .userInteractive)

// Fetching the lowest priority global queue
let lowestPrioGlobalQueue = DispatchQueue.global(qos: .background)

// Creating a private serial queue
let serialQueue = DispatchQueue(label: "com.ebubekirsezer.serial")

// Creating a private concurrent queue
let concurrentQueue = DispatchQueue(label: "com.ebubekirsezer.concurrent", attributes: .concurrent)

// Creating a private concurrent queue with QoS .userInititated
let highPriConcurrentQueue = DispatchQueue(label: "com.ebubekirsezer.highPrioConcurrent", qos: .userInitiated, attributes: .concurrent)
