type t<'a, 'b> = result<'a, 'b> = Ok('a) | Error('b)

let getExnWithMessage = (x, message) =>
  switch x {
  | Ok(x) => x
  | Error(_) => Js.Exn.raiseError(message)
  }

let mapWithDefault = (opt, default, f) =>
  switch opt {
  | Ok(x) => f(x)
  | Error(_) => default
  }
let map = (opt, f) =>
  switch opt {
  | Ok(x) => Ok(f(x))
  | Error(y) => Error(y)
  }
let flatMap = (opt, f) =>
  switch opt {
  | Ok(x) => f(x)
  | Error(y) => Error(y)
  }

let mapError = (result, fn) => {
  switch result {
  | Ok(_) as ok => ok
  | Error(error) => Error(fn(error))
  }
}

let getWithDefault = (opt, default) =>
  switch opt {
  | Ok(x) => x
  | Error(_) => default
  }

let isOk = x =>
  switch x {
  | Ok(_) => true
  | Error(_) => false
  }

let isError = x =>
  switch x {
  | Ok(_) => false
  | Error(_) => true
  }
