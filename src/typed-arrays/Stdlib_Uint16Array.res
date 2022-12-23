type t = Stdlib_TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Uint16Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Uint16Array"
@new external fromBuffer: Stdlib_ArrayBuffer.t => t = "Uint16Array"
@new external fromBufferToEnd: (Stdlib_ArrayBuffer.t, ~byteOffset: int) => t = "Uint16Array"
@new
external fromBufferWithRange: (Stdlib_ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Uint16Array"
@new external fromLength: int => t = "Uint16Array"
@val external from: 'a => t = "Uint16Array.from"
