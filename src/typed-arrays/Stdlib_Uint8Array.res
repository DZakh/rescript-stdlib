type t = Stdlib_TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Uint8Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Uint8Array"
@new external fromBuffer: Stdlib_ArrayBuffer.t => t = "Uint8Array"
@new external fromBufferToEnd: (Stdlib_ArrayBuffer.t, ~byteOffset: int) => t = "Uint8Array"
@new
external fromBufferWithRange: (Stdlib_ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Uint8Array"
@new external fromLength: int => t = "Uint8Array"
@val external from: 'a => t = "Uint8Array.from"
