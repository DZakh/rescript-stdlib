type t = Stdlib_TypedArray.t<Stdlib_BigInt.t>

module Constants = {
  @val external bytesPerElement: int = "BigUint64Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "BigUint64Array"
@new external fromBuffer: Stdlib_ArrayBuffer.t => t = "BigUint64Array"
@new external fromBufferToEnd: (Stdlib_ArrayBuffer.t, ~byteOffset: int) => t = "BigUint64Array"
@new
external fromBufferWithRange: (Stdlib_ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "BigUint64Array"
@new external fromLength: int => t = "BigUint64Array"
@val external from: 'a => t = "BigUint64Array.from"
