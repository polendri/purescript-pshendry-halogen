// module PSHendry.Data.Number
"use strict"

exports.toFixed = function(ds) {
  return function(n) {
    return n.toFixed(ds);
  }
}

exports.toPrecision = function(ds) {
  return function(n) {
    return n.toPrecision(ds).replace(/\.?0+$/, "");
  }
}
