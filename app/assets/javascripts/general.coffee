$ ->
  $(document).on 'click', '.tiny-overlay', (e) ->
    e.stopPropagation()
    e.preventDefault()

  $(document).on 'click', '.full-screen-image-container', ->
    $('#open-left-side-bar').removeClass('active');
    $('#left-side-bar').removeClass('active');
    $("#myModal").toggle();
    $('#myModal').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();

  $(document).on 'click', '#open-left-side-bar', (e) ->
    e.stopPropagation()
    e.preventDefault()
    $('#left-side-bar').toggleClass('active')
    $('.full-screen-image-container').toggleClass('active')

  $('#myModal').on 'shown.bs.modal', ->
    $('#open-left-side-bar').addClass('active')

  if $('#left-side-bar').hasClass('active')
    $('.full-screen-image-container').addClass('active')

