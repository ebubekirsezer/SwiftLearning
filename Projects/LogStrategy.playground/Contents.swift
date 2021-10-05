import UIKit

protocol LogStrategy {
    func log(entry: String)
    func retrieveLogs() -> [String]?
}

final class LoggerContext {
    private var strategy: LogStrategy
    private var logQueue = DispatchQueue(label: "ConsoleLogQueue")
    
    init(strategy: LogStrategy) {
        self.strategy = strategy
    }
    
    func write(entry: String) {
        logQueue.sync {
            strategy.log(entry: entry)
        }
    }
    
    var logs: [String]? {
        var result: [String]? = nil
        logQueue.sync {
            result = strategy.retrieveLogs()
        }
        return result
    }
}

class ConsoleLogStrategy: LogStrategy {
    func log(entry: String) {
        print(entry)
    }
    
    func retrieveLogs() -> [String]? {
        return nil
    }
}

class InMemoryLogStrategy: LogStrategy {
    private var logEntries = [String]()
    
    func log(entry: String) {
        logEntries.append(entry)
    }
    
    func retrieveLogs() -> [String]? {
        return logEntries
    }
}

let logger = LoggerContext(strategy: InMemoryLogStrategy())
logger.write(entry: "Strategy pattern demo")
logger.write(entry: "Cool, isn't it?")

logger.logs?.forEach { print($0)}
