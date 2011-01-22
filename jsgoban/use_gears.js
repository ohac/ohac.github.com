function gogear_setStatus(s) {
  $('gears_status').innerHTML = s;
}

var STORE_NAME = 'jsgoban-store'
var localServer;
var store;

var gogear_filesToCapture = [
  location.pathname,
  'css/common.css',
  'css/gecko.css',
  'css/go.css',
  'css/opera.css',
  'css/webkit.css',
  'css/ie.css',
  'css/mobile_safari.css',
  'prototype.js',
  'skins.js',
  'skins/common/bg.jpg',
  'skins/skin_debug.js',
  'skins/skin_en.js',
  'skins/skin_jp.js',
  'skins/skin_jp2.js',
  'skins/skin_g.js',
  'skins/skin_g.d/black.gif',
  'skins/skin_g.d/grid.gif',
  'skins/skin_g.d/grid_b.gif',
  'skins/skin_g.d/grid_l.gif',
  'skins/skin_g.d/grid_lb.gif',
  'skins/skin_g.d/grid_lt.gif',
  'skins/skin_g.d/grid_r.gif',
  'skins/skin_g.d/grid_rb.gif',
  'skins/skin_g.d/grid_rt.gif',
  'skins/skin_g.d/grid_t.gif',
  'skins/skin_g.d/star.gif',
  'skins/skin_g.d/white.gif',
  'msgs.js',
  'msgs/msgs_en.js',
  'msgs/msgs_ja.js',
  'msgs/msgs_ja2.js',
  'go.js',
  'use_gears.js',
  'gears_init.js'
];

function gogear_init() {
  if (location.protocol.indexOf('http') != 0) { return; }
  if (!window.google || !google.gears) { return; }
  try {
    localServer = google.gears.factory.create('beta.localserver', '1.0');
  }
  catch (ex) { return; }
  store = localServer.openStore(STORE_NAME);
  gogear_setStatus('Ready');
  if (!store) {
    gogear_setStatus('create ' + STORE_NAME);
    store = localServer.createStore(STORE_NAME);
  }
}

function gogear_capture() {
  if (!store) { return; }
  store.capture(gogear_filesToCapture, gogear_captureCallback);
}

function gogear_captureCallback(url, success, captureId) {
  gogear_setStatus(url + ' captured');
  if (success) { return; }
  gogear_setStatus(url + ' captured failed');
}

function gogear_uncapture() {
  if (!store) { return; }
  for (var i = 0; i < gogear_filesToCapture.length; i++) {
    store.remove(gogear_filesToCapture[i]);
  }
}

function gogear_removeStore() {
  if (!store) { return; }
  if (!localServer.openStore(STORE_NAME)) { return; }
  localServer.removeStore(STORE_NAME);
  store = null;
}

function gogear_db() {
  var rp1 = new Array(0);
  var rp2 = new Array(0);
  var db = google.gears.factory.create('beta.database', '1.0');
  db.open('jsgoban-db2');
  db.execute('create table if not exists gametable (id integer not null, sgf, size)');
  db.execute('replace into gametable values(0, "fgC", "9")');
  var rs = db.execute('select * from gametable');
  var index = 0;
  while (rs.isValidRow()) {
    rp1[index] = rs.field(1);
    rp2[index] = rs.field(2);
    index++;
    rs.next();
  }
  rs.close();
  // db.execute('drop table gametable');
  db.close();
  start(rp1[0], rp2[0]);
}
