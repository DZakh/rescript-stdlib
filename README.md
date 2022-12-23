# @dzakh/rescript-stdlib

**This is vendored stdlib for personal usage**

Learn more about vendoring a standard library at [rescript-stdlib-vendorer](https://github.com/DZakh/rescript-stdlib-vendorer). Feel free to fork and use it for your own projects. The main idea is that you can always adjust to yourself.

## Acknowledgements

- Gabriel (@zth) from whom I copied the initial stdlib project. The repo is private now, but you can still find some traces on [npm](https://www.npmjs.com/package/@gabnor/rescript-stdlib).
- @bloodyowl + contributors to `rescript-js` are the people who've done the heavy lifting here, since this stdlib is based fully on `rescript-js`.
- Also a shout out to the authors of `Belt`, as a few key things have been incorporated directly from `Belt`.
- Patrick (@ryyppy) for his work on `rescript-promise`, which is fully inlined into the stdlib.

## Installation

ReScript `>=10.1` is required.

```console
$ npm i @dzakh/rescript-stdlib
```

Then add `rescript-stdlib` to your `bsconfig.json`'s `bs-dependencies`:

```diff
 {
   "bs-dependencies": [
+    "@dzakh/rescript-stdlib"
   ]
 }
```

Open the standard library so it's available in the global scope. This is important because this is the way it'll ship in the compiler eventually, automatically available in the global scope.

```diff
 {
   "bsc-flags": [
+    "-open RescriptStdlib",
   ]
 }
```

## What it looks like

```rescript
Console.log("Hello world!")

let timeout = setTimeout(() => {
  Console.log("Hello!")
}, 100)

clearTimeout(timeout)

let array = [1, 2, 3]

let sum = array
  ->Array.map(x => x * 2)
  ->Array.reduce((acc, item) => acc + item, 0)

let maybeValidFloats = ["1", "1.5", "some random string"]

let validFloats = maybeValidFloats
  ->Array.filterMap(v => v->Float.fromString)
```

## Differences to `rescript-js`

This standard library is based on `rescript-js`, but with a few tweaks and modifications:

### Array

- `reduce`/`reduceReverse` and friends (withIndex versions) are taken from `Belt` and replace the bindings to the JavaScript equivalents (`reduce` and `reduceRight`). The `reduce` versions from `Belt` works fully with type inference because of the argument order being reversed (`init` value comes first), whereas the JavaScript versions don't work well with inference. The runtime added for this is minor (and very fast still), and we want users to have to annotate as little as possible for the standard functions they'll be using.
- `push`/`pushMany`/`unshift`/`unshiftMany` are changed to return `unit`, for convenience. In JS, these return the new length of the array. That's however extremely rare to actually use, and you can just do `Array.length(array)` after pushing to get the new length. Changing the return type to be `unit` gets rid of needing to do `let _ = ` (or `->ignore`), which can be confusing for beginners.
- `findIndexOpt`/`lastIndexOf`/`indexOfOpt` are added, returning `None` instead of `-1` if the item searched for does not exist. These are in addition to `findIndex`/`lastIndexOf`, which still returns `-1` when the item you're looking for does not exist.
- `getUnsafe` added (copied from `Belt`).
- `setUnsafe` added (copied from `Belt`).
- `reverse` added (copied from `Belt`), in addition to existing `reverseInPlace`. `reverseInPlace` is zero cost but does not produce a new array. `reverse` does produce a new array.
- `keepMap` and `keepMapU` is added from `Belt`, but **renamed to `filterMap`**. Rationale: `filterMap` is closer to the JS convention of naming. It's also available in other languages like Rust. `keep` et al can confuse beginners, who're bound to be looking for `filter` style names since that's what JS has.
- `shuffle` and `shuffleInPlace` are added (copied from `Belt`).
- `flatMap` added (copied from `Belt`, but using native `map` and `concat` functions).

### Float

- `fromString` is copied from `Belt`. Main difference is that `fromString` now returns an `option` that's `None` if the parsed float is `NaN`. If you want the raw JS behavior of potentially parsing a float to `NaN` you can use `Float.parseFloat(string)`.
- `parseInt` and `parseIntWithRadix` are removed. They were present in `Float` as a way of dealing with `parseInt` potentially returning `NaN`, which is a float.
- `parseFloat` takes a `string` and not any type `'a`.

### String

- `searchOpt`/`indexOfOpt`/`lastIndexOfOpt` added. Convenience methods for returning an `option` instead of returning `-1` for not found.
- Added bindings for `localeCompare`.

### Promise

The `Promise` module is inlined from https://github.com/ryyppy/rescript-promise, with these additions:

- Jaap's `ignorePromise` PR is merged.

### Option, List, Result

- The above stated modules are brought in from `Belt`, since they're widely used in the ecosystem.
- In `Option` and `List`, the same naming convention is applied as in `Array` for `keep*` functions. As in `keep` becomes `filter`, `keepMap` becomes `filterMap`, etc.

### window, document

- `window` and `document` are typed as `Dom.window`/`Dom.document` rather than open objects (`{..}`).

### Name clashes

Since the standard library is designed to live in the global scope, you _might_ have your own modules whose names might collide with the modules from the standard library. The easiest way to solve this is to just rename your own module to something else.
