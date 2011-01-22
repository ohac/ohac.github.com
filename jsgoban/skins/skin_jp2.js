/*  skin_jp2.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var skin_jp2 = {
	name: 'ja2',
	init: function() { init_skin_jp2(); },
	grid_norm: '┼',
	grid_lt: '┌',
	grid_rt: '┐',
	grid_lb: '└',
	grid_rb: '┘',
	grid_l: '├',
	grid_r: '┤',
	grid_t: '┬',
	grid_b: '┴',
	grid_star: '┼',
	stone_white: '○',
	stone_black: '●',
	stone_white_1: '☆',
	stone_black_1: '★',
	stone_white_small: '',
	stone_black_small: '',
	address_left: true,
	address_x_str: 'abcdefghijkmnopqrst',
	address_left_x: '※',
	address_x: [],
	address_y: []
};

function init_skin_jp2() {
	for (var i = 0; i < 19; i++) {
		skin_jp2['address_x'][i] =
			'ａｂｃｄｅｆｇｈｉｊｋｍｎｏｐｑｒｓｔ'.substr(i, 1);
		skin_jp2['address_y'][i] =
			'１２３４５６７８９０１２３４５６７８９'.substr(i, 1);
	}
	for (var i = 0; i < 9; i++) {
		var c = '壱弐参四五六七八九'.charAt(i);
		skin_jp2['stone_black_' + (i + 2)] = c;
		skin_jp2['stone_white_' + (i + 2)] = c;
	}
}

var skin_jp3 = {
	name: 'ja3',
	init: function() { init_skin_jp3(); },
	grid_norm: '┼',
	grid_lt: '┌',
	grid_rt: '┐',
	grid_lb: '└',
	grid_rb: '┘',
	grid_l: '├',
	grid_r: '┤',
	grid_t: '┬',
	grid_b: '┴',
	grid_star: '┼',
	stone_white: '○',
	stone_black: '●',
	stone_white_1: '☆',
	stone_black_1: '★',
	stone_white_small: '',
	stone_black_small: '',
	address_left: true,
	address_x_str: 'abcdefghijkmnopqrst',
	address_left_x: '--',
	address_x: [],
	address_y: []
};

function init_skin_jp3() {
	for (var i = 0; i < 19; i++) {
		skin_jp3['address_x'][i] = 'abcdefghijkmnopqrst'.substr(i, 1) + '-';
		skin_jp3['address_y'][i] =
			'１２３４５６７８９０１２３４５６７８９'.substr(i, 1);
	}
	for (var i = 0; i < 9; i++) {
		var c = '壱弐参四五六七八九'.charAt(i);
		skin_jp3['stone_black_' + (i + 2)] = c;
		skin_jp3['stone_white_' + (i + 2)] = c;
	}
}

skins.push(skin_jp2);
skins.push(skin_jp3);
