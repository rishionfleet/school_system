$(document).ready(function() {

  $('#teachers-tab').on('click', function() {
    $('.tab-pane#teachers-tab').addClass('active')
    $('.tab-pane#students-tab').removeClass('active')
    $('.tab-pane#subjects-tab').removeClass('active')
  })
  $('#students-tab').on('click', function() {
    $('.tab-pane#students-tab').addClass('active')
    $('.tab-pane#teachers-tab').removeClass('active')
    $('.tab-pane#subjects-tab').removeClass('active')
  })
  $('#subjects-tab').on('click', function() {
    $('.tab-pane#subjects-tab').addClass('active')
    $('.tab-pane#teachers-tab').removeClass('active')
    $('.tab-pane#students-tab').removeClass('active')
  })

  $('#new_teacher').submit(function(e) {
    e.preventDefault();
    $.ajax({
      type: "POST",
      url : "/teachers",
      data: $("#new_teacher").serialize(), // serializes the form's elements.
      success: function(data)
      {
        window.location.reload()
      }
    });
  });

})