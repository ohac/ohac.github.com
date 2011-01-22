/*  txt2link.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  txt2link is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

Event.observe(window, 'load', function() {
	Event.observe('convert_text', 'click', function() {
		var result_text = $F('input_text');
		var rgexp = /(http:\/\/[^\s]*)/g;
		var repl = '<a href="$1">$1</a>';
		result_text = result_text.replace(rgexp, repl);
		rgexp = /\n/g;
		repl = '<br>';
		result_text = result_text.replace(rgexp, repl);
		$('result_text').innerHTML = result_text;
	});
});
