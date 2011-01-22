/*  skin_debug.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var skin_debug = {
	name: 'Debug',
	init: function() { init_skin_debug(); },
	grid_norm: '.',
	grid_lt: '.',
	grid_rt: '.',
	grid_lb: '.',
	grid_rb: '.',
	grid_l: '.',
	grid_r: '.',
	grid_t: '.',
	grid_b: '.',
	grid_star: ',',
	stone_white: 'O',
	stone_black: 'X',
	stone_white_small: 'O',
	stone_black_small: 'X',
	address_x_str: 'ABCDEFGHJKLMNOPQRST',
	address_x: [],
	address_y: []
};

function init_skin_debug() {
	for (var i = 0; i < 19; i++) {
		skin_debug['address_x'][i] = 'ABCDEFGHJKLMNOPQRST'.substr(i, 1);
		skin_debug['address_y'][i] = (i + 1);
	}
}

skins.push(skin_debug);
