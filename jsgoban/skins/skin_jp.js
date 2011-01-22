/*  skin_jp.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var skin_jp = {
	name: 'ja',
	init: function() { init_skin_jp(); },
	grid_norm: '┼',
	grid_lt: '┏',
	grid_rt: '┓',
	grid_lb: '┗',
	grid_rb: '┛',
	grid_l: '┠',
	grid_r: '┨',
	grid_t: '┯',
	grid_b: '┷',
	grid_star: '╋',
	stone_white: '○',
	stone_black: '●',
	stone_white_1: '☆',
	stone_black_1: '★',
	stone_white_small: '○',
	stone_black_small: '●',
	address_x_str2: '〇〇〇〇〇〇〇〇〇十十十十十十十十十十二',
	address_x_str: '一二三四五六七八九〇一二三四五六七八九〇',
	address_x: [],
	address_x2: [],
	address_y: []
};

function init_skin_jp() {
	for (var i = 0; i < 19; i++) {
		skin_jp['address_x2'][i] =
			'〇〇〇〇〇〇〇〇〇十十十十十十十十十十二'.substr(i, 1);
		skin_jp['address_x'][i] =
			'一二三四五六七八九〇一二三四五六七八九〇'.substr(i, 1);
		skin_jp['address_y'][i] = (i + 1);
	}
	for (var i = 0; i < 9; i++) {
		var c = '壱弐参四五六七八九'.charAt(i);
		skin_jp['stone_black_' + (i + 2)] = c;
		skin_jp['stone_white_' + (i + 2)] = c;
	}
}

var skin_jp_color = {
	name: 'ja(c)',
	init: function() { init_skin_jp_color(); },
	grid_norm: '┼',
	grid_lt: '┏',
	grid_rt: '┓',
	grid_lb: '┗',
	grid_rb: '┛',
	grid_l: '┠',
	grid_r: '┨',
	grid_t: '┯',
	grid_b: '┷',
	grid_star: '╋',
	stone_white: '<span class="white">●</span>',
	stone_black: '●',
	stone_white_small: '<span class="white">●</span>',
	stone_black_small: '●',
	address_x_str2: '〇〇〇〇〇〇〇〇〇十十十十十十十十十十二',
	address_x_str: '一二三四五六七八九〇一二三四五六七八九〇',
	address_x: [],
	address_x2: [],
	address_y: []
};

function init_skin_jp_color() {
	for (var i = 0; i < 19; i++) {
		skin_jp_color['address_x2'][i] =
			'〇〇〇〇〇〇〇〇〇十十十十十十十十十十二'.substr(i, 1);
		skin_jp_color['address_x'][i] =
			'一二三四五六七八九〇一二三四五六七八九〇'.substr(i, 1);
		skin_jp_color['address_y'][i] = (i + 1);
	}
	for (var i = 0; i < 9; i++) {
		var c = '★壱弐参四五六七八九'.charAt(i);
		skin_jp_color['stone_black_' + (i + 1)] = c;
		skin_jp_color['stone_white_' + (i + 1)] = '<span class="white">' +
			c + '</span>';
	}
}

skins.push(skin_jp);
skins.push(skin_jp_color);
