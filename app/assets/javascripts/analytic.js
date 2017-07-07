$(document).on('click','.fa-angle-left', function(){
  $('#stat-left').removeClass('hide');
  $('#stat-right').addClass('hide');
  $('.btn-previous').addClass('hide');
  $('.btn-next').removeClass('hide');
});

$(document).on('click','.fa-angle-right', function(){
  $('#stat-right').removeClass('hide');
  $('#stat-left').addClass('hide');
  $('.btn-next').addClass('hide');
  $('.btn-previous').removeClass('hide');
});
