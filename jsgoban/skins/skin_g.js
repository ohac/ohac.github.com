/*  skin_g.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var skin_g = {
	name: 'G',
	init: function() { init_skin_g(); },
	grid_norm: '<img src="skins/skin_g.d/grid.gif" class="stoneimg"></img>',
	grid_lt: '<img src="skins/skin_g.d/grid_lt.gif" class="stoneimg"></img>',
	grid_rt: '<img src="skins/skin_g.d/grid_rt.gif" class="stoneimg"></img>',
	grid_lb: '<img src="skins/skin_g.d/grid_lb.gif" class="stoneimg"></img>',
	grid_rb: '<img src="skins/skin_g.d/grid_rb.gif" class="stoneimg"></img>',
	grid_l: '<img src="skins/skin_g.d/grid_l.gif" class="stoneimg"></img>',
	grid_r: '<img src="skins/skin_g.d/grid_r.gif" class="stoneimg"></img>',
	grid_t: '<img src="skins/skin_g.d/grid_t.gif" class="stoneimg"></img>',
	grid_b: '<img src="skins/skin_g.d/grid_b.gif" class="stoneimg"></img>',
	grid_star: '<img src="skins/skin_g.d/star.gif" class="stoneimg"></img>',
	stone_white: '<img src="skins/skin_g.d/white.gif" class="stoneimg"></img>',
	stone_black: '<img src="skins/skin_g.d/black.gif" class="stoneimg"></img>',
	stone_white_small:
		'<img src="skins/skin_g.d/white.gif" width="15" height="15"></img>',
	stone_black_small:
		'<img src="skins/skin_g.d/black.gif" width="15" height="15"></img>',
	address_x_str: 'ABCDEFGHJKLMNOPQRST',
	address_x: [],
	address_y: []
};

function init_skin_g() {
	for (var i = 0; i < 19; i++) {
		skin_g['address_x'][i] = '<span class="boardaddressx">' +
			'ABCDEFGHJKLMNOPQRST'.substr(i, 1) + ' ' + '</span>';
		skin_g['address_y'][i] = (i + 1);
	}
}

skins.push(skin_g);
