module Array = Stdlib_Array
module Console = Stdlib_Console
module DataView = Stdlib_DataView
module Date = Stdlib_Date
module Dict = Stdlib_Dict
module Error = Stdlib_Error
module Float = Stdlib_Float
module Global = Stdlib_Global
module Int = Stdlib_Int
module BigInt = Stdlib_BigInt
module Math = Stdlib_Math
module Null = Stdlib_Null
module Nullable = Stdlib_Nullable
module Object = Stdlib_Object
module Promise = Stdlib_Promise
module RegExp = Stdlib_RegExp
module String = Stdlib_String
module Undefined = Stdlib_Undefined
module Symbol = Stdlib_Symbol
module Type = Stdlib_Type
module JSON = Stdlib_JSON

module Iterator = Stdlib_Iterator
module AsyncIterator = Stdlib_AsyncIterator
module Map = Stdlib_Map
module WeakMap = Stdlib_WeakMap
module Set = Stdlib_Set
module WeakSet = Stdlib_WeakSet

module ArrayBuffer = Stdlib_ArrayBuffer
module TypedArray = Stdlib_TypedArray
module Float32Array = Stdlib_Float32Array
module Float64Array = Stdlib_Float64Array
module Int8Array = Stdlib_Int8Array
module Int16Array = Stdlib_Int16Array
module Int32Array = Stdlib_Int32Array
module Uint8Array = Stdlib_Uint8Array
module Uint16Array = Stdlib_Uint16Array
module Uint32Array = Stdlib_Uint32Array
module Uint8ClampedArray = Stdlib_Uint8ClampedArray
module BigInt64Array = Stdlib_BigInt64Array
module BigUint64Array = Stdlib_BigUint64Array

module Intl = Stdlib_Intl

module Serializer = Stdlib_Serializer

@val external window: Dom.window = "window"
@val external document: Dom.document = "document"
@val external globalThis: {..} = "globalThis"

external null: Stdlib_Null.t<'a> = "#null"
external undefined: Stdlib_Undefined.t<'a> = "#undefined"
external typeof: 'a => Stdlib_Type.t = "#typeof"

include Stdlib_Global

type t<'a> = Js.t<'a>
module Fn = Js.Fn
module MapperRt = Js.MapperRt
module Internal = Js.Internal
module Re = Stdlib_RegExp // needed for the %re sugar
module Exn = Js.Exn
module Option = Stdlib_Option
module List = Stdlib_List
module Result = Stdlib_Result

type null<+'a> = Js.null<'a>

type undefined<+'a> = Js.undefined<'a>

type nullable<+'a> = Js.nullable<'a>
