/*  go.js version 0.1_alpha
 *  (c) 2007 OHASHI Hideya
 *
 *  jsgoban is freely distributable under the terms of an MIT-style license.
 *--------------------------------------------------------------------------*/

var JSGobanUtil = {

	get_uri_params: function() {
		var href = window.location.href;
		var pos = href.lastIndexOf('?');
		var rv = {};
		if (pos > 0) {
			var querystr = href.substr(pos + 1);
			var params = querystr.split('&');
			for (var i = 0; i < params.length; i++) {
				var param = params[i];
				var pos2 = param.indexOf('=');
				if (pos2 <= 0) { continue; }
				var p_v = param.split('=');
				rv[p_v[0]] = unescape(p_v[1]);
			}
		}
		return rv;
	},

	sprintf: function(str) {
		var arg = arguments;
		for (var i = 0; i < arg.length; i++) {
			if (arg[i]== undefined) { arg[i] = ""; }
		}
		var i = 1;
		return str.replace(/(([^\\]?)%(s|d))/g, function(s, a1, a2) {
			return a2 + arg[i++]; });
	},

	switchStyleByName: function(name) {
		var sheets = document.styleSheets;
		for (var i = 0; i < sheets.length; i++) {
			sheets[i].disabled = true;
			if (sheets[i].title == name) { sheets[i].disabled = false; }
		}
	}

};

var JSGoban = Class.create({

	initialize: function(prefix) {
		this.smjs_debug = false;
		this.board_size_max = 19;
		this.board_size = 9;
		this.move_number = 0;
		this.back_number = 1;
		this.hide_sequence = false;
		this.captured_stone_counter = { stone_black: 0, stone_white: 0 };
		this.board = new Array(this.board_size_max);
		this.skin = skins[0];
		this.msg = msgs[0];
		this.sequence = [];
		this.current_url = '';
		this.black_turn = true;
		this.prefix = prefix;
		this.prefix2 = 'jsgobans[\'' + prefix + '\'].';

		init_skins();
		var i = 0;
		for (i = 0; i < this.board_size_max; i++) {
			var part = new Array(this.board_size_max);
			for (var j = 0; j < this.board_size_max; j++) {
				part[j] = null;
			}
			this.board[i] = part;
		}

		var skin_selecter = $(this.prefix + 'skin_selecter');
		if (skin_selecter != null) {
			var link_a = '<a href="#" onclick="' + this.prefix2 +
				'select_skin(';
			var link_b = '); this.blur(); return false;">';
			var link_c = '</a> ';
			var html = 'Skins [ ';
			for (i = 0; i < skins.length; i++) {
				if (i > 0) { html += '| '; }
				html += link_a + i + link_b + skins[i]['name'] + link_c;
			}
			html += ' ]<br />';
			skin_selecter.innerHTML = html;
		}

		var boardsize_selecter = $(this.prefix + 'boardsize_selecter');
		if (boardsize_selecter != null) {
			link_a = '<a href="#" onclick="' + this.prefix2 +
				'select_boardsize(';
			html = 'Board size [ ';
			for (i = 0; i < 3; i++) {
				if (i > 0) { html += '| '; }
				var size = [9, 13, 19][i];
				html += link_a + size + link_b + size + link_c;
			}
			html += ' ]<br />';
			boardsize_selecter.innerHTML = html;
		}

		var msg_selecter = $(this.prefix + 'msg_selecter');
		if (msg_selecter != null) {
			link_a = '<a href="#" onclick="' + this.prefix2 + 'select_msg(';
			html = 'Languages [ ';
			for (i = 0; i < msgs.length; i++) {
				if (i > 0) { html += '| '; }
				html += link_a + i + link_b + msgs[i]['lang'] + link_c;
			}
			html += ' ]<br />';
			msg_selecter.innerHTML = html;
		}

		var browser_name = 'Unknown';
		if (Prototype.Browser.IE) { browser_name = 'IE'; }
		else if (Prototype.Browser.Opera) { browser_name = 'Opera'; }
		else if (Prototype.Browser.WebKit) { browser_name = 'WebKit'; }
		else if (Prototype.Browser.Gecko) { browser_name = 'Gecko'; }
		else if (Prototype.Browser.MobileSafari) {
			browser_name = 'MobileSafari';
		}
		JSGobanUtil.switchStyleByName(browser_name);
		var browser_info = $(this.prefix + 'browser_info');
		if (browser_info != null) {
			browser_info.innerHTML = 'Your browser: ' + browser_name;
		}

		this.draw_sequence_selecter();
	},

	start: function(sgf, bsiz) {
		var params = JSGobanUtil.get_uri_params();
		var mb = $(this.prefix + 'mb');
		if (mb != null) {
			mb.checked = true;
			$(this.prefix + 'mw').checked = false;
			$(this.prefix + 'mn').checked = false;
		}
		var sgf4uri = params['s'];
		var bsize = params['b'];
		if (sgf != null) { sgf4uri = sgf; }
		if (bsiz != null) { bsize = bsiz; }
		if (bsize != null) { this.board_size = bsize; }
		if (sgf4uri != null) {
			var sgf_sequence = this.import_sgf4uri(sgf4uri);
			for (var i = 0; i < sgf_sequence.length; i++) {
				var seq = sgf_sequence[i];
				if (mb != null) {
					mb.checked = seq[0];
					$(this.prefix + 'mw').checked = !seq[0];
				}
				this.black_turn = seq[0];
				this.action(seq[1], seq[2], true);
			}
		}
		this.draw();
	},

	draw_sequence_selecter: function() {
		var sequence_selecter = $(this.prefix + 'sequence_selecter');
		if (sequence_selecter == null) { return; }
		var link_a = '<a href="#" onclick="' + this.prefix2 + 'select_seq(';
		var link_b = '); this.blur(); return false;">';
		var link_c = '</a> ';
		var html = '';
		html += link_a + '1' + link_b + '&lt;-' + link_c;
		html += ' ' + this.back_number + ' ';
		html += link_a + '-1' + link_b + '-&gt;' + link_c;
		html += ' ';
		html += link_a + '0' + link_b + (this.hide_sequence ? 'to show' :
			'to hide') + link_c;
		sequence_selecter.innerHTML = html;
	},

	search_when: function(i, j) {
		for (var s = 0; s < this.sequence.length; s++) {
			var move = this.sequence[s];
			if (move[1] == i && move[2] == j) { return s; }
		}
		return -1;
	},

	draw: function() {
		if ($(this.prefix + 'lbl_black') != null) {
			$(this.prefix + 'lbl_black').innerHTML = this.msg['black'];
			$(this.prefix + 'lbl_white').innerHTML = this.msg['white'];
			$(this.prefix + 'lbl_capture').innerHTML = this.msg['capture'];
		}
		var i = 0;
		var j = 0;
		var lastmove = this.sequence[this.sequence.length - 1];
		var link_a = '<a href="#" class="boardlink" onclick="' +
			this.prefix2 + 'action(';
		var link_b = '); this.blur(); return false;">';
		var link_c = '</a>';
		var html = JSGobanUtil.sprintf(this.msg['title'], 'Title',
			this.skin['stone_black_small'],
			'Player1', this.skin['stone_white_small'], 'Player2') +
			'<br />\n<br />\n';
		html += '<div class="boardarea">\n';
		for (i = 0; i < this.board_size; i++) {
			var f_top = (i == 0);
			var f_bottom = (i == this.board_size - 1);
			if (this.skin['address_left'] == true) {
				html += this.skin['address_y'][this.board_size - 1 - i];
			}
			for (j = 0; j < this.board_size; j++) {
				var f_left = (j == 0);
				var f_right = (j == this.board_size - 1);
				var f_star = false;
				if (this.board_size == 9) {
					f_star = ((i == 2 || i == 6) && (j == 2 || j == 6));
				}
				else if (this.board_size == 13) {
					f_star = ((i == 3 || i == 13 - 4) &&
						(j == 3 || j == 13 - 4));
					f_star |= (i == 6 && j == 6);
				}
				else if (this.board_size == 19) {
					f_star = ((i == 3 || i == 19 - 4) &&
						(j == 3 || j == 19 - 4));
					f_star |= ((i == 9) && (j == 3 || j == 9 || j == 19 - 4));
					f_star |= ((j == 9) && (i == 3 || i == 9 || i == 19 - 4));
				}
				var stat = this.board[i][j]
				if (stat != null) {
					var pos = this.search_when(i, j);
					var pos2 = this.back_number - (this.sequence.length - pos);
					if (pos != -1 && 0 <= pos2) {
						var lastmove_image = this.skin[stat + '_' + (pos2 + 1)];
						if (lastmove_image != null) {
							stat = lastmove_image;
						}
						else {
							stat = this.skin[stat];
						}
						if (this.hide_sequence) { stat = null; }
					}
					else {
						stat = this.skin[stat];
					}
				}
				if (stat == null) {
					var id = 'grid_norm';
					if (f_left || f_right || f_top || f_bottom) {
						id = 'grid_' + (f_left ? 'l' : '') +
								(f_right ? 'r' : '')
								+ (f_top ? 't' : '') + (f_bottom ? 'b' : '');
					}
					else if (f_star) {
						id = 'grid_star';
					}
					stat = this.skin[id];
				}
				if (this.smjs_debug) { html += stat; }
				else { html += link_a + i + ',' + j + link_b + stat + link_c }
			}
			if (this.skin['address_left'] == true) {
				html += '<span class="boardaddressy"></span><br />\n';
			}
			else {
				var str = this.skin['address_y'][this.board_size - 1 - i];
				if (this.board_size > 9) { str = (' ' + str).substr(-2); }
				html += '<span class="boardaddressy">' + str +
					'</span><br />\n';
			}
		}
		html += '\n</div>\n';
		if (this.skin['address_left'] == true) {
			html += this.skin['address_left_x'];
		}
		if (this.board_size > 9 && this.skin['address_x2'] != null) {
			for (j = 0; j < this.board_size; j++) {
				html += this.skin['address_x2'][j];
			}
			html += '<br />\n';
		}
		for (j = 0; j < this.board_size; j++) {
			html += this.skin['address_x'][j];
		}
		html += '<br />\n';
		html += '<br />\n';
		html += JSGobanUtil.sprintf(this.msg['move_number'], this.move_number);
		if (lastmove != null) {
			var str2 = '';
			if (this.board_size > 9 && this.skin['address_x_str2'] != null) {
				str2 = this.skin['address_x_str2'].charAt(lastmove[2]);
			}
			html += ' (' + (this.board_size - lastmove[1]) + ', ' + str2 +
				this.skin['address_x_str'].charAt(lastmove[2]) + ')';
		}
		html += '<br />\n';
		if (this.msg['captured_title'] != null) {
			html += this.msg['captured_title'];
		}
		html += JSGobanUtil.sprintf(this.msg['has_captured'], this.msg['black'],
			this.skin['stone_black_small'],
			this.captured_stone_counter['stone_white']);
		if (this.msg['captured_noeol'] != true) { html += '<br />\n'; }
		html += JSGobanUtil.sprintf(this.msg['has_captured'], this.msg['white'],
			this.skin['stone_white_small'],
			this.captured_stone_counter['stone_black']) + '<br />\n';
		html += '<br />\n';
		$(this.prefix + 'board').innerHTML = html;

		var urlarea = $(this.prefix + 'url');
		if (urlarea != null) {
			var href = window.location.href;
			if (href.charAt(href.length - 1) == '#') {
				href = href.substr(0, href.length - 1);
			}
			var pos = href.lastIndexOf('?');
			if (pos > 0) { href = href.substr(0, pos); }
			href = href + '?';
			if (this.board_size != 9) {
				href += 'b=' + this.board_size + '&';
			}
			href += 's=' + this.export_sgf4uri();
			this.current_url = href;
			html = '<a href="' + href + '">' + href + '</a>\n';
			if ($(this.prefix + 'sgf') != null) {
				$(this.prefix + 'sgf').innerHTML = this.export_sgf();
			}
			urlarea.innerHTML = html;
		}
	},

	capture_stones_impl: function(i, j, simu, captured_stone) {
		if (i < 0 || j < 0 || i >= this.board_size || j >= this.board_size) {
			return true;
		}
		if (this.board[i][j] == 0) { return true; } // already done
		if (this.board[i][j] == null) { return false; } // not surrounded
		// another stone
		if (this.board[i][j] != captured_stone) { return true; }
		this.board[i][j] = 0; // marked
		var sflag = true;
		if (!this.capture_stones_impl(i - 1, j, simu, captured_stone)) {
			sflag = false;
		}
		if (!this.capture_stones_impl(i, j - 1, simu, captured_stone)) {
			sflag = false;
		}
		if (!this.capture_stones_impl(i + 1, j, simu, captured_stone)) {
			sflag = false;
		}
		if (!this.capture_stones_impl(i, j + 1, simu, captured_stone)) {
			sflag = false;
		}
		return sflag;
	},

	capture_stones: function(i, j, simu) {
		var captured_stone = this.board[i][j];
		var sflag = this.capture_stones_impl(i, j, simu, captured_stone);
		var to_capture = simu ? sflag : true;
		for (var i = 0; i < this.board_size; i++) {
			for (var j = 0; j < this.board_size; j++) {
				if (this.board[i][j] == 0) {
					this.board[i][j] = to_capture ? null : captured_stone;
					if (to_capture) {
						this.captured_stone_counter[captured_stone]++;
					}
				}
			}
		}
	},

	action: function(i, j, skipdraw) {
		var mode = this.black_turn ? 'stone_black' : 'stone_white';
		this.black_turn = !this.black_turn;
		if ($(this.prefix + 'form') != null) {
			var mode_form = Form.getInputs(this.prefix + 'form', 'radio',
				'mode');
			var mode_form_radio = mode_form.find(function(radio) {
				return radio.checked; });
			mode = mode_form_radio.value;
			if (mode == 'null') { mode = null; }
		}
		var captured_stone = this.board[i][j];
		var mb = $(this.prefix + 'mb');
		if (mode == null) {
			this.capture_stones(i, j, false);
			var f_black = (captured_stone == 'stone_black');
			if (mb != null) {
				mb.checked = f_black;
				$(this.prefix + 'mw').checked = !f_black;
				$(this.prefix + 'mn').checked = false;
			}
		}
		else if (captured_stone != null) {
			this.board[i][j] = captured_stone;
		}
		else {
			var f_black = (mode == 'stone_black');
			if (this.sequence.length > 0) {
				var last_f_black = this.sequence[this.sequence.length - 1][0];
				if (last_f_black == f_black) {
					// handicap stones
					if (this.sequence.length == 1) { this.move_number -= 1; }
					this.move_number -= 1;
				}
			}
			if (mb != null) {
				mb.checked = !f_black;
				$(this.prefix + 'mw').checked = f_black;
			}
			this.sequence.push([f_black, i, j]);
			this.move_number++;
			this.board[i][j] = mode;
			var opponent = f_black ? 'stone_white' : 'stone_black';
			if ((i + 1) < this.board_size && this.board[i + 1][j] == opponent) {
				this.capture_stones(i + 1, j, true);
			}
			if ((i - 1) >= 0 && this.board[i - 1][j] == opponent) {
				this.capture_stones(i - 1, j, true);
			}
			if ((j + 1) < this.board_size && this.board[i][j + 1] == opponent) {
				this.capture_stones(i, j + 1, true);
			}
			if ((j - 1) >= 0 && this.board[i][j - 1] == opponent) {
				this.capture_stones(i, j - 1, true);
			}
		}
		if (!skipdraw) { this.draw(); }
	},

	select_seq: function(i) {
		if (i == 0) {
			this.hide_sequence = !this.hide_sequence;
		}
		else {
			this.back_number += i;
			if (this.back_number < 0) { this.back_number = 0; }
		}
		this.draw_sequence_selecter();
		this.draw();
	},

	select_skin: function(i) {
		this.skin = skins[i];
		this.draw();
	},

	select_boardsize: function(size) {
		this.board_size = size;
		this.draw();
	},

	select_msg: function(i) {
		this.msg = msgs[i];
		this.draw();
	},

	export_sgf: function() {
		var now = new Date();
		var sgf =
			"(;FF[4]GM[1]SZ[" + this.board_size + "]AP[jsgoban:0.2]\n" +
			"\n" +
			"PB[Player1]\n" +
			"PW[Player2]\n" +
			"KM[6.5]\n" +
			"DT[" + now.getFullYear() + "-" +
			("0" + (now.getMonth() + 1)).substr(-2) + "-" +
			("0" + now.getDate()).substr(-2) + "]\n" +
			"\n";
		var astr = 'abcdefghijklmnopqrs';
		for (var i = 0; i < this.sequence.length; i++) {
			var move = this.sequence[i];
			sgf += ';' + (move[0] ? 'B' : 'W') + '[' +
				astr.charAt(move[2]) + astr.charAt(move[1]) + ']';
			if ((i % 10) == 9) { sgf += "\n"; }
		}
		return sgf + ")\n";
	},

	import_sgf: function(sgftext) {
		var rv = [];
		var astr = 'abcdefghijklmnopqrs';
		var parts = sgftext.split(';');
		var f_black = true;
		for (var i = 0; i < parts.length; i++) {
			var part = parts[i];
			if (part.charAt(1) != '[') { continue; }
			if (part.charAt(0) == 'B') { f_black = true; }
			else if (part.charAt(0) == 'W') { f_black = false; }
			else { continue; }
			part = part.substr(2, 2);
			var x = astr.indexOf(part.charAt(0));
			var y = astr.indexOf(part.charAt(1));
			rv.push([f_black, x, y]);
		}
		return rv;
	},

	export_sgf4uri: function() {
		var sgf = '';
		var astr = 'abcdefghijklmnopqrs';
		var bstr = 'tuvwxyzABCDEFGHIJKLMNOPQ@RSTUVWXYZ0123456789_.-+:';

		// move image
		// tuvwxyz
		// ABCDEFG
		// HIJKLMN
		// OPQ@RST
		// UVWXYZ0
		// 1234567
		// 89_.-+:

		var pre_move = [ false, 0, 0 ];
		for (var i = 0; i < this.sequence.length; i++) {
			var move = this.sequence[i];
			// these stones are the same color? then insert passing.
			if (move[0] == pre_move[0]) { sgf += '/'; }
			var diffx = move[1] - pre_move[1];
			var diffy = move[2] - pre_move[2];
			if (diffx < -3 || diffx > 3 || diffy < -3 || diffy > 3) {
				sgf += astr.charAt(move[1]) + astr.charAt(move[2]);
			}
			else {
				diffx += 3;
				diffy += 3;
				diffy *= 7;
				sgf += bstr.charAt(diffx + diffy);
			}
			pre_move = move;
		}
		return sgf;
	},

	import_sgf4uri: function(sgftext) {
		var rv = [];
		var astr = 'abcdefghijklmnopqrs';
		var bstr = 'tuvwxyzABCDEFGHIJKLMNOPQ@RSTUVWXYZ0123456789_.-+:';
		var f_black = true;
		var x = 0;
		var y = 0;
		var pre_x = 0;
		var pre_y = 0;
		for (var i = 0; i < sgftext.length;) {
			var c1 = sgftext.charAt(i++);
			var pos = bstr.indexOf(c1);
			if (pos >= 0) {
				x = pre_x + (pos % 7) - 3;
				y = pre_y + ((pos - (pos % 7)) / 7) - 3;
			}
			else if (c1 == '/') {
				// pass
				f_black = !f_black;
				continue;
			}
			else {
				var c2 = sgftext.charAt(i++);
				x = astr.indexOf(c1);
				y = astr.indexOf(c2);
			}
			rv.push([f_black, x, y]);
			pre_x = x;
			pre_y = y;
			f_black = !f_black;
		}
		return rv;
	},

	nanourl_req: function() {
		var v = this.current_url;
		var s = document.createElement('script');
		s.setAttribute('src',
		'http://ohac.pun.jp/jsgoban/tinyurl2json.cgi?url=' + v);
		document.body.appendChild(s);
	},

	dummy: null

});

function tinyurl2json_callback(url) {
	// FIXME how can I access this.prefix?
//	$(this.prefix + 'nanourl').innerHTML =
	$('1_nanourl').innerHTML =
	'<a href="' + url + '">' + url + '</a>';
}

var jsgoban = null;
var jsgobans = {};

function start(sgf, bsiz) {
	jsgoban = new JSGoban('1_');
	jsgoban.start(sgf, bsiz);
	jsgobans[jsgoban.prefix] = jsgoban;
}

function action(i, j, skipdraw) {
	jsgoban.action(i, j, skipdraw);
}

function draw() {
	jsgoban.draw();
}

function select_seq(i) {
	jsgoban.select_seq(i);
}

function select_skin(i) {
	jsgoban.select_skin(i);
}

function select_boardsize(size) {
	jsgoban.select_boardsize(size);
}

function select_msg(i) {
	jsgoban.select_msg(i);
}

function nanourl_req() {
	jsgoban.nanourl_req();
}

function export_sgf() {
	return jsgoban.export_sgf();
}

function export_sgf4uri() {
	return jsgoban.export_sgf4uri();
}

function import_sgf(sgf) {
	return jsgoban.import_sgf(sgf);
}

function import_sgf4uri(sgf) {
	return jsgoban.import_sgf4uri(sgf);
}
