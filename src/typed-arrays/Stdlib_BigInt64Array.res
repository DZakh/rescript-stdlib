type t = Stdlib_TypedArray.t<Stdlib_BigInt.t>

module Constants = {
  @val external bytesPerElement: int = "BigInt64Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "BigInt64Array"
@new external fromBuffer: Stdlib_ArrayBuffer.t => t = "BigInt64Array"
@new external fromBufferToEnd: (Stdlib_ArrayBuffer.t, ~byteOffset: int) => t = "BigInt64Array"
@new
external fromBufferWithRange: (Stdlib_ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "BigInt64Array"
@new external fromLength: int => t = "BigInt64Array"
@val external from: 'a => t = "BigInt64Array.from"
