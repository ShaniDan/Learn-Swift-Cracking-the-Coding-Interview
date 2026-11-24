// swift-tools-version:5.9
//
//  LearnSwift-CTCI — learn Swift from zero, then solve "Cracking the Coding Interview" problems.
//
//  You never need to edit this file. Open this folder in Xcode (File → Open… → choose the
//  LearnSwift-CTCI folder, or double-click Package.swift) and read README.md.
//
import PackageDescription

let lessons = [
    "Lesson01_HelloSwift",
    "Lesson02_Numbers",
    "Lesson03_Strings",
    "Lesson04_Functions",
    "Lesson05_Conditions",
    "Lesson06_Loops",
    "Lesson07_Optionals",
    "Lesson08_Arrays",
    "Lesson09_DictionariesSets",
    "Lesson10_ClosuresSorting",
    "Lesson11_StructsClasses",
    "Lesson12_ErrorsDebugging",
    "Lesson13_BigO",
    "Lesson14_Ch1_ArraysStrings",
    "Lesson15_Ch2_LinkedLists",
    "Lesson16_Ch3_StacksQueues",
    "Lesson17_Ch4_TreesGraphs",
    "Lesson18_Ch5_BitManipulation",
    "Lesson19_Ch8_RecursionDP",
    "Lesson20_Ch10_SortingSearching",
    "Lesson21_Ch16_17_Mixed",
]

let package = Package(
    name: "LearnSwift-CTCI",
    platforms: [.macOS(.v13)],
    targets:
        // Tiny helper library (the todo() marker and a timer for speed checks).
        [.target(name: "Support", path: "Support")]
        // Every lesson is its own little program: pick it in the scheme menu and press Cmd+R.
        + lessons.map { .executableTarget(name: $0, dependencies: ["Support"], path: "Lessons/\($0)") }
        // The checks that grade your exercises: press Cmd+U.
        + [.testTarget(name: "Checks",
                       dependencies: ["Support"] + lessons.map { .target(name: $0) },
                       path: "Checks")],
    swiftLanguageVersions: [.v5]
)
