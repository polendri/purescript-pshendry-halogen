// module Utils.DOM
"use strict"

exports.blur = function(id) {
  return function() {
    return document.getElementById(id).blur();
  }
}

exports.focus = function(id) {
  return function() {
    return document.getElementById(id).focus();
  }
}

exports.select = function(id) {
  return function() {
    return document.getElementById(id).select();
  }
}
