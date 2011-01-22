/*  skins.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var skins = [];

function init_skins() {
	for (var i = 0; i < skins.length; i++) {
		skins[i].init();
	}
}
