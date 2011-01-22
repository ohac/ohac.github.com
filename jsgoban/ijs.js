/**
 * Interactive JavaScript with prototype.js
 *
 * Usage:
 * $ js
 * js> load('ijs.js')
 * js> $w('1 2 3')
 * 1,2,3
 */
var window = { location: {} };
var navigator = { userAgent: '', };
var dummy_div = { appendChild: function(text) {} };
var document = {
	createElement: function(type) { return dummy_div; },
	createEvent: function(name) { return {}; },
	createTextNode: function() { return {}; },
	getElementById: function(id) { return {}; },
	write: function(str) {},
};
var Element = { Methods: {} };
var HTMLElement = { prototype: {} };
load('prototype.js');
