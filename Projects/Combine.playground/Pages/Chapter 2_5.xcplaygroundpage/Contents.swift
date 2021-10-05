
import Foundation
import Combine

//(1) Declare an Int PassThroughSubject
let subject = PassthroughSubject<Int, Never>()
//(2) Attach a subscriber to the subject
let subscription = subject
    .sink { print($0) }

//(3) Publish the value 94 via the subject directly
subject.send(94)

//(4) Connect subject to a publisher, and publish the value 29
Just(29)
    .subscribe(subject)

//(5) Declare another subject, a CurrentValueSubject with an initial ı am a ....
let anotherSubject = CurrentValueSubject<String, Never>("I am a.....")

//(6) Attach a subscriber to the subject
let anotherSubscription = anotherSubject
    .sink { print($0) }

//(7) Publish the value Subject via subject directly
anotherSubject.send("Subject ")


