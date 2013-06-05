jQuery ->
  $("#repositoryURL").blur ->
    if this.value.match(/git:\/\/github.com\/[\w-]*\/[\w-]*.git/)
      $("#url_error").text("")
      $(this).css('background-color' : '#FFFFFF')
    else
      $("#url_error").text("Invalid URL").css('color' : '#C00000')
      $(this).css('background-color' : '#FF3333')
  $("#startDate").change ->
    if this.value.match("^$|0?([1-9]|[12][0-9]|3[01])-(0?[1-9]|1[012])-((19|20)[0-9][0-9])")
      $("#start_date_error").text("")
      $(this).css('background-color' : '#FFFFFF')
    else
      $("#start_date_error").text("Invalid date.").css('color' : '#C00000')
      $(this).css('background-color' : '#FF3333')
  $("#endDate").change ->
    if this.value.match("^$|0?([1-9]|[12][0-9]|3[01])-(0?[1-9]|1[012])-((19|20)[0-9][0-9])")
      $("#end_date_error").text("")
      $(this).css('background-color' : '#FFFFFF')
    else
      $("#end_date_error").text("Invalid date.").css('color' : '#C00000')
      $(this).css('background-color' : '#FF3333')



