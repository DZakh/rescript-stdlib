// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("rescript/lib/js/curry.js");
var Js_exn = require("rescript/lib/js/js_exn.js");

function getExnWithMessage(x, message) {
  if (x.TAG === /* Ok */0) {
    return x._0;
  } else {
    return Js_exn.raiseError(message);
  }
}

function mapWithDefault(opt, $$default, f) {
  if (opt.TAG === /* Ok */0) {
    return Curry._1(f, opt._0);
  } else {
    return $$default;
  }
}

function map(opt, f) {
  if (opt.TAG === /* Ok */0) {
    return {
            TAG: /* Ok */0,
            _0: Curry._1(f, opt._0)
          };
  } else {
    return {
            TAG: /* Error */1,
            _0: opt._0
          };
  }
}

function flatMap(opt, f) {
  if (opt.TAG === /* Ok */0) {
    return Curry._1(f, opt._0);
  } else {
    return {
            TAG: /* Error */1,
            _0: opt._0
          };
  }
}

function getWithDefault(opt, $$default) {
  if (opt.TAG === /* Ok */0) {
    return opt._0;
  } else {
    return $$default;
  }
}

function isOk(x) {
  if (x.TAG === /* Ok */0) {
    return true;
  } else {
    return false;
  }
}

function isError(x) {
  if (x.TAG === /* Ok */0) {
    return false;
  } else {
    return true;
  }
}

exports.getExnWithMessage = getExnWithMessage;
exports.mapWithDefault = mapWithDefault;
exports.map = map;
exports.flatMap = flatMap;
exports.getWithDefault = getWithDefault;
exports.isOk = isOk;
exports.isError = isError;
/* No side effect */
