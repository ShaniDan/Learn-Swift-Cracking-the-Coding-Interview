// Helpers used by the lessons and the checks. You don't need to read or change this file.

import Foundation

/// Marks an exercise you haven't started yet.
/// When you begin an exercise, DELETE the `todo()` line and write your code.
/// While it's still there, the checks show the exercise as "skipped" (grey) instead of failed (red).
public func todo() {
    Todo.recorder?.hits += 1
}

public final class TodoRecorder: @unchecked Sendable {
    public var hits = 0
    public init() {}
}

public enum Todo {
    @TaskLocal public static var recorder: TodoRecorder?

    /// Runs `body` and reports whether it reached a `todo()` (meaning: exercise not started).
    public static func notStarted(_ body: () -> Void) -> Bool {
        let recorder = TodoRecorder()
        $recorder.withValue(recorder) { body() }
        return recorder.hits > 0
    }
}

/// Runs `work` on a background thread and returns false if it didn't finish in time.
/// Used by the checks to catch solutions that are correct but too slow (see Lesson 13, Big O).
public func finishes(within seconds: Double, _ work: @escaping () -> Void) -> Bool {
    let done = DispatchSemaphore(value: 0)
    let thread = Thread {
        work()
        done.signal()
    }
    thread.stackSize = 64 << 20 // room for deep recursion
    thread.start()
    return done.wait(timeout: .now() + seconds) == .success
}
