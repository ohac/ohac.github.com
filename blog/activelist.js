function start() {
	var i;
	var child;
	for (i = 1; true; i++) {
		child = $('l' + i)
		if (child == null) { break; }
		hide_folder('l' + i);
	}
}

function rm_folder(folder) {
	var child;
	child = $(folder);
	if (child == null) { return; }
	child.style.display = "none";
	var i;
	for (i = 1; true; i++) {
		child = $(folder + '_' + i);
		if (child == null) { break; }
		rm_folder(folder + '_' + i);
	}
}

function hide_folder(folder) {
	s = $(folder + '_s')
	if (s == null) { return; }
	s.style.display = "";
	$(folder + '_h').style.display = "none";
	var i;
	var child;
	for (i = 1; true; i++) {
		child = $(folder + '_' + i);
		if (child == null) { break; }
		child.style.display = "none";
		hide_folder(folder + '_' + i);
	}
}

function show_folder(folder) {
	$(folder + '_s').style.display = "none";
	$(folder + '_h').style.display = "";
	var i;
	var child;
	for (i = 1; true; i++) {
		child = $(folder + '_' + i);
		if (child == null) { break; }
		child.style.display = "";
	}
}
