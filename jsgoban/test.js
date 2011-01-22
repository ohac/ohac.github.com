#!/usr/bin/js
var window = {
	location: { href: 'http://localhost/index.html?s=hoge&b=9' }
};
var navigator = {
	userAgent: 'foo bar',
	appVersion: 'foo bar'
};
var dummy_div = {
	appendChild: function(text) {}
};
var dummy_mb = {
	type: "radio", name: "mode", checked: true, value: 'stone_black'
};
var dummy_mw = {
	type: "radio", name: "mode", checked: false, value: 'stone_white'
};
var dummy_mn = {
	type: "radio", name: "mode", checked: false, value: 'null'
};
var dummy_form_impl = [ dummy_mb, dummy_mw, dummy_mn ];
var dummy_form = {
	getElementsByTagName: function(tagname) {
		return dummy_form_impl;
	}
};
var dummy_board = {
	innerHTML: ""
};
var document = {
	createElement: function(type) { return dummy_div; },
    createEvent: function(name) { return {}; },
	createTextNode: function() { return {}; },
	getElementById: function(id) {
		if (id == '1_form') { return dummy_form; }
		if (id == '1_mb') { return dummy_mb; }
		if (id == '1_mw') { return dummy_mw; }
		if (id == '1_mn') { return dummy_mn; }
		if (id == '1_board') { return dummy_board; }
		return {};
	},
	write: function(str) { print(str); },
	styleSheets: []
};
var Element = {
	Methods: {}
};
var HTMLElement = {
	prototype: {}
};
try { load('prototype.js'); } catch (e) { print('prototype ' + e); }
print('loading skin.js ...');
try { load('skins.js'); } catch (e) { print('skins ' + e); }
print('loading skin_jp.js ...');
try { load('skins/skin_jp.js'); } catch (e) { print('skin_jp ' + e); }
print('loading skin_debug.js ...');
try { load('skins/skin_debug.js'); } catch (e) { print('skin_debug ' + e); }
print('loading msgs.js ...');
try { load('msgs.js'); } catch (e) { print('msgs ' + e); }
print('loading msgs_en.js ...');
try { load('msgs/msgs_en.js'); } catch (e) { print('msgs_en ' + e); }
print('loading go.js ...');
try { load('go.js'); } catch (e) { print('go ' + e); }
print('done');

function print_turn() {
	print('black: ' + dummy_mb.checked + ', white: ' + dummy_mw.checked);
}

start();
print_turn();
action(3, 3); print_turn();
action(3, 4); print_turn();
action(4, 4);
action(4, 3);
jsgoban.skin = skin_debug;
jsgoban.smjs_debug = true;
draw(); print(dummy_board.innerHTML);

// export SGF
print(export_sgf());
print(export_sgf4uri());

// clear board
for (var i = 0; i < jsgoban.board_size_max; i++) {
	for (var j = 0; j < jsgoban.board_size_max; j++) {
		jsgoban.board[i][j] = null;
	}
}
draw(); print(dummy_board.innerHTML);

// draw test pattern 1
var board_image = [
	'OX',
	'OOX',
	'XOX',
	'O OX',
	'XOX',
	' XOX',
];
for (var i = 0; i < board_image.length; i++) {
	var row = board_image[i];
	for (var j = 0; j < row.length; j++) {
		var stone = row[j];
		if (stone == 'O') { jsgoban.board[i][j] = 'stone_white'; }
		if (stone == 'X') { jsgoban.board[i][j] = 'stone_black'; }
	}
}
draw(); print(dummy_board.innerHTML);

// to capture stones
dummy_mb.checked = true; dummy_mw.checked = false; dummy_mn.checked = false;
action(3, 1);
draw(); print(dummy_board.innerHTML); print_turn();

// test URI params
var params = JSGobanUtil.get_uri_params();
print(params['s']);
print(params['b']);
print(params['z']);

// import SGF test
for (var i = 0; i < jsgoban.board_size_max; i++) {
	for (var j = 0; j < jsgoban.board_size_max; j++) {
		jsgoban.board[i][j] = null;
	}
}
var sgftext =
	"(;FF[4]GM[1]SZ[9]AP[go-js:0.2]\n"
	+ "\n"
	+ "PB[player1]\n"
	+ "PW[player2]\n"
	+ "KM[6.5]\n"
	+ "DT[2007-10-02]\n"
	+ "\n"
	+ ";B[dd];W[de];B[ee];W[ed])\n"

var sgf_sequence = import_sgf(sgftext);
dummy_mb.checked = true; dummy_mw.checked = false; dummy_mn.checked = false;
for (var i = 0; i < sgf_sequence.length; i++) {
	var seq = sgf_sequence[i];
	print('' + seq[0] + ': ' + seq[1] + ' ' + seq[2]);
	action(seq[1], seq[2]);
}
draw(); print(dummy_board.innerHTML); print_turn();

// import SGF for URI test
for (var i = 0; i < jsgoban.board_size_max; i++) {
	for (var j = 0; j < jsgoban.board_size_max; j++) {
		jsgoban.board[i][j] = null;
	}
}
sgf_sequence = import_sgf4uri(':XRK');
dummy_mb.checked = true; dummy_mw.checked = false; dummy_mn.checked = false;
for (var i = 0; i < sgf_sequence.length; i++) {
	var seq = sgf_sequence[i];
	print('' + seq[0] + ': ' + seq[1] + ' ' + seq[2]);
	action(seq[1], seq[2]);
}
draw(); print(dummy_board.innerHTML); print_turn();
