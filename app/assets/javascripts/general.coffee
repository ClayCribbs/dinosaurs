$ ->
  $(document).on 'click', '.tiny-overlay', (e) ->
    e.stopPropagation()
    e.preventDefault()

  $(document).on 'click', '#myModal', ->
    $("#myModal").toggle();
    $('#myModal').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();

  $(document).on 'click', '#open-left-side-bar', (e) ->
    e.stopPropagation()
    e.preventDefault()
    $('#left-side-bar-btn').toggleClass('active')
    $('#body-wrapper').toggleClass('active')
    $('#left-side-bar').toggleClass('active')
    $('#arrow').toggleClass('fa-arrow-right').toggleClass('fa-arrow-left')
    $('.full-screen-image-container').toggleClass('active')

  $('#myModal').on 'shown.bs.modal', ->

  if $('#left-side-bar').hasClass('active')
    $('.full-screen-image-container').addClass('active')

