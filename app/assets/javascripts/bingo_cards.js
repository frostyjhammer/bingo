var dkColor;
var ltColor;
var hasBingo = false;
$(document).ready(function() {
  $.each($('td'), function(i, td) { td.onclick = function() { doClick(this); }; });
  $.each($('.btn'), function(i, btn) {
    btn.onclick = function() { doColor(this); };
    btn.style.color = '#'+btn.classList[1];
    btn.style.backgroundColor = '#'+btn.classList[2];
    btn.style.textcolor = '#'+btn.classList[1];
  });
  doColor($('.btn[value="gray"]')[0]);
});
function doClick(td) {
  if (td.id == 'free-space') return false;
  var cl = td.className.split(' ');
  cl[0] = (td.classList[0] == 'uncovered') ? 'covered' : 'uncovered';
  td.className = cl.join(' ');
  td.style.backgroundColor = td.classList[0] == 'covered' ? dkColor : ltColor;
  setTimeout('doCheckBingo()',20);
}
function doCheckBingo() {
  var numCovered = 0;
  $.each($('td'), function(i, td) { numCovered += td.classList[0] == 'covered' ? 1 : 0 });
  if (numCovered >= 25 ) {
    custom_alert('Blackout');
    return;
  }
  if (numCovered <= 1) {
    hasBingo = false;
  }
  if (hasBingo) return;
  for (row = 1; row <= 5; row++) {
    numCovered = 0;
    $.each($('td.r'+row), function(i, td) { numCovered += td.classList[0] == 'covered' ? 1 : 0 });
    if (numCovered >= 5 ) {
      hasBingo = true;
      custom_alert('Row ' + row);
      return;
    }
  }
  for (col = 1; col <= 5; col++) {
    numCovered = 0;
    $.each($('td.c'+col), function(i, td) { numCovered += td.classList[0] == 'covered' ? 1 : 0 });
    if (numCovered >= 5 ) {
      hasBingo = true;
      custom_alert('Column ' + col);
      return;
    }
  }
  for (diag = 1; diag <= 5; diag++) {
    numCovered = 0;
    $.each($('td.d'+diag), function(i, td) { numCovered += td.classList[0] == 'covered' ? 1 : 0 });
    if (numCovered >= 5 ) {
      hasBingo = true;
      custom_alert('Diagonal ' + diag);
      return;
    }
  }
}
function doColor(btn) {
  if (!btn) return false;
  dkColor = '#' + btn.classList[1];
  ltColor = '#' + btn.classList[2];
  $.each($('th'), function(i, th) { th.style.backgroundColor = dkColor; });
  $.each($('td'), function(i, td) { td.style.backgroundColor = td.classList[0] == 'covered' ? dkColor : ltColor; });
}
function custom_alert(str) {
  $.dialog({
    boxWidth: '330px',
    useBootstrap: false,
    title: '<span class="alert-title">&nbsp;BINGO!&nbsp;</span>',
    content: '<span class="alert-content">'+str+'</span>',
    escapeKey: true,
    backgroundDismiss: true,
    animationSpeed: 1234
  });
}
