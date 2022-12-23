type t = Stdlib_TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Int32Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Int32Array"
@new external fromBuffer: Stdlib_ArrayBuffer.t => t = "Int32Array"
@new external fromBufferToEnd: (Stdlib_ArrayBuffer.t, ~byteOffset: int) => t = "Int32Array"
@new
external fromBufferWithRange: (Stdlib_ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Int32Array"
@new external fromLength: int => t = "Int32Array"
@val external from: 'a => t = "Int32Array.from"
