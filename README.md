# Learn Swift → Crack the Coding Interview

A step-by-step Swift course for Xcode. You start with `print("Hello")` and finish on the interview problems in
*Cracking the Coding Interview* (CtCI, 6th edition). Tests grade every exercise, so you always know whether
your answer is right.

> 📕 **Your book:** `~/Downloads/Cracking the Coding Interview_ 189 Programming Questions and Solutions.pdf`
> Page numbers below are **PDF page numbers**, the ones your PDF viewer shows. They aren't the numbers printed on
> the pages. In Preview, press `Cmd+Option+G` to jump to a page.

---

## Open it in Xcode

**File → Open…** → choose the **`LearnSwift-CTCI`** folder (or double-click `Package.swift`).
Wait a few seconds while Xcode loads the package.

## How every lesson works

Each lesson is a folder in **`Lessons/`** with two files:

| File | What it's for |
|------|---------------|
| `main.swift` | Explanations and examples. Read it, run it, change it. |
| `Exercises.swift` | Your homework. Fill in the functions. |

1. **Pick the lesson** in the scheme menu at the top of the Xcode window (next to the ▶ button), for example
   `Lesson01_HelloSwift`.
2. **Read `main.swift`** and press **Cmd+R** to run it. The output appears in the console at the bottom
   (`Cmd+Shift+Y` shows or hides it).
3. **Open `Exercises.swift`.** For each exercise, **delete the `todo()` line** and the placeholder `return`, then
   write your own code.
4. **Press Cmd+U** to run the checks, then open the **Test navigator** (`Cmd+6`):
   - ✅ green: correct
   - ❌ red: wrong. Click it to see exactly what your function returned, for example
     `cube(2) → 6`, when `8` was expected.
   - ⏭ grey (skipped): you haven't started it yet (the `todo()` line is still there)
5. When a lesson's whole suite is green, move on to the next one.

**Tips**
- Cmd+U runs the checks for every lesson. Unfinished ones are skipped, so it takes about a second. To run only
  one lesson, open its file in `Checks/` and click the ◇ diamond next to `@Suite`, or hover over the lesson in
  the Test navigator and click ▶.
- To debug a failing exercise, click a line number in your exercise to set a breakpoint, then press Cmd+U.
  Xcode pauses there during the test. Lesson 12 shows you how.
- If your code **crashes** (for example `Index out of range`), Xcode stops at the line that crashed. That's normal
  in Swift, and it shows you exactly where the bug is.
- Stuck for more than 20 minutes? Look at `Solutions/` (same lesson names). Read the solution, close it, then
  write your own answer from memory.

---

## The roadmap

### Part 1: Swift from zero (lessons 01–12)
You don't need the book for this part. These lessons give you the Swift you'll use for every problem in it.

| # | Scheme | You'll learn |
|---|--------|--------------|
| 01 | `Lesson01_HelloSwift` | print, `let` vs `var`, types, string interpolation |
| 02 | `Lesson02_Numbers` | Int/Double, `/` and `%` (used constantly), converting types |
| 03 | `Lesson03_Strings` | Swift strings, why `s[0]` doesn't work, `Array(s)`, `asciiValue` |
| 04 | `Lesson04_Functions` | `func`, argument labels, `_`, default values, return |
| 05 | `Lesson05_Conditions` | if/else, `switch` with ranges, FizzBuzz |
| 06 | `Lesson06_Loops` | for-in, ranges, `stride`, while, the accumulator pattern |
| 07 | `Lesson07_Optionals` | `?`, `if let`, `guard let`, `??`, and why `!` crashes |
| 08 | `Lesson08_Arrays` | arrays, `inout`, 2D grids, two pointers |
| 09 | `Lesson09_DictionariesSets` | **hash tables**: counting, grouping, the famous Two Sum |
| 10 | `Lesson10_ClosuresSorting` | tuples, closures, map/filter/reduce, `sorted(by:)` |
| 11 | `Lesson11_StructsClasses` | struct vs class (copy vs share), enums, nodes that point to other nodes |
| 12 | `Lesson12_ErrorsDebugging` | throws/try/catch, crash messages, **the Xcode debugger** |

### Part 2: Thinking like an interviewer (lesson 13)

| # | Scheme | Read in the book |
|---|--------|------------------|
| 13 | `Lesson13_BigO` | **VI. Big O**, PDF p. 58 (most important chapter) · **VII. Technical Questions**, PDF p. 72 |

### Part 3: The CtCI interview chapters (lessons 14–21)
For each lesson: **read the chapter intro in the book first**, solve the exercises, run the checks, then compare
your answers with the book's solutions. The exercises use the book's problem numbers, such as 1.1 Is Unique and
2.8 Loop Detection.

| # | Scheme | Chapter intro + questions | Book solutions |
|---|--------|---------------------------|----------------|
| 14 | `Lesson14_Ch1_ArraysStrings` | Ch 1, PDF p. 100 | PDF p. 204 |
| 15 | `Lesson15_Ch2_LinkedLists` | Ch 2, PDF p. 104 | PDF p. 220 |
| 16 | `Lesson16_Ch3_StacksQueues` | Ch 3, PDF p. 108 | PDF p. 239 |
| 17 | `Lesson17_Ch4_TreesGraphs` | Ch 4, PDF p. 112 | PDF p. 253 |
| 18 | `Lesson18_Ch5_BitManipulation` | Ch 5, PDF p. 124 | PDF p. 288 |
| 19 | `Lesson19_Ch8_RecursionDP` | Ch 8, PDF p. 142 | PDF p. 354 |
| 20 | `Lesson20_Ch10_SortingSearching` | Ch 10, PDF p. 158 | PDF p. 408 |
| 21 | `Lesson21_Ch16_17_Mixed` | Ch 16, PDF p. 193 · Ch 17, PDF p. 198 | PDF p. 474 · 542 |

The book's **hints** start on PDF p. 664. Try a hint before you look at a full solution.

**Note: the book's code is in Java.** Lesson 14 has a Java → Swift cheat sheet. Copy the book's *approach*, not
its syntax.

### After you finish
- Solve the book's problems that the lessons skipped. Add a new function to a lesson's `Exercises.swift` and
  write a test for it in that lesson's file in `Checks/`, copying the pattern you see there.
- Chapter 7 *Object-Oriented Design* (PDF p. 137) and Chapter 9 *System Design* (PDF p. 149) are discussion
  chapters. Read them closer to interview time.
- Read the non-coding chapters too: I–V (PDF p. 16–57) and VIII *The Offer and Beyond* (PDF p. 94).

---

## Suggested pace

| Weeks | Lessons | Daily habit |
|-------|---------|-------------|
| 1–2 | 01–07 | about one lesson per day |
| 3 | 08–12 | redo any exercise that felt shaky |
| 4 | 13 | read the Big O chapter twice |
| 5–10 | 14–21 | about one chapter per week, 2–3 problems per day |

Solve each interview problem **out loud** and on paper before you type anything. Real interviews work that way.

---

## Xcode cheat sheet

| Action | Keys |
|--------|------|
| Run the selected lesson's examples | `Cmd+R` |
| Run the checks | `Cmd+U` |
| Test navigator (see ✅ ❌ ⏭) | `Cmd+6` |
| Show/hide the console | `Cmd+Shift+Y` |
| Stop a running program | `Cmd+.` |
| Comment/uncomment lines | `Cmd+/` |
| Quick help for a function | Option-click its name |
| Jump to a file | `Cmd+Shift+O` |
| Debugger: step over / step into / continue | `F6` / `F7` / `Ctrl+Cmd+Y` |

---

## What's in this folder

```
LearnSwift-CTCI/
├── README.md       ← you are here
├── Package.swift   ← the project definition (no need to edit)
├── Lessons/        ← YOUR files: one folder per lesson (main.swift + Exercises.swift)
├── Checks/         ← the tests Cmd+U runs (read them to see the expected answers)
├── Solutions/      ← reference answers for each Exercises.swift (try first!)
└── Support/        ← the todo() helper (no need to edit)
```

**Want to redo a lesson from scratch?** Untouched copies of every `Exercises.swift` are kept in the hidden
`.backup/` folder. In Terminal, run this from the `LearnSwift-CTCI` folder:
`cp .backup/Lesson14_Ch1_ArraysStrings_Exercises.swift Lessons/Lesson14_Ch1_ArraysStrings/Exercises.swift`
(It overwrites your current answers, so save a copy first if you want to keep them.)
