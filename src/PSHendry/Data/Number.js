// module PSHendry.Data.Number
"use strict"

exports.toPrecision = function(ds) {
  return function(n) {
    return n.toPrecision(ds).replace(/\.?0+$/, "");
  }
}
