type t = Stdlib_TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Uint8ClampedArray.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Uint8ClampedArray"
@new external fromBuffer: Stdlib_ArrayBuffer.t => t = "Uint8ClampedArray"
@new
external fromBufferToEnd: (Stdlib_ArrayBuffer.t, ~byteOffset: int) => t = "Uint8ClampedArray"
@new
external fromBufferWithRange: (Stdlib_ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Uint8ClampedArray"
@new external fromLength: int => t = "Uint8ClampedArray"
@val external from: 'a => t = "Uint8ClampedArray.from"
