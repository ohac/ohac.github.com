/*  skin_en.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var skin_en = {
	name: 'en',
	init: function() { init_skin_en(); },
	grid_norm: '. ',
	grid_lt: '. ',
	grid_rt: '. ',
	grid_lb: '. ',
	grid_rb: '. ',
	grid_l: '. ',
	grid_r: '. ',
	grid_t: '. ',
	grid_b: '. ',
	grid_star: '+ ',
	stone_white: 'O ',
	stone_black: 'X ',
	stone_white_small: 'O',
	stone_black_small: 'X',
	address_x_str: 'ABCDEFGHJKLMNOPQRST',
	address_x: [],
	address_y: []
};

function init_skin_en() {
	for (var i = 0; i < 19; i++) {
		skin_en['address_x'][i] = 'ABCDEFGHJKLMNOPQRST'.substr(i, 1) + ' ';
		skin_en['address_y'][i] = (i + 1);
	}
	for (var i = 0; i < 9; i++) {
		var c = '123456789'.charAt(i) + ' ';
		skin_en['stone_black_' + (i + 1)] = c;
		skin_en['stone_white_' + (i + 1)] = c;
	}
}

skins.push(skin_en);
