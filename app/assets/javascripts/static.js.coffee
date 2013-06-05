jQuery ->
  $("#repositoryURL").keypress ->
    if this.value.match(/git:\/\/github.com\/[\w-]*\/[\w-]*.git/)
      $("#url_error").text("")
      $(this).css('border' : '1px solid #cccccc')
    else
      $("#url_error").text("Invalid URL").css('color' : '#C00000')
      $(this).css('border' : '1px solid #FF3333')
  $("#startDate,#endDate").blur ->
    if this.value.match("^$|0?([1-9]|[12][0-9]|3[01])-(0?[1-9]|1[012])-((19|20)[0-9][0-9])")
      $(this).parent().find('span').text("")
      $(this).css('border' : '1px solid #cccccc')
    else
      $(this).parent().find('span').text("Invalid date.").css('color' : '#C00000')
      $(this).css('border' : '1px solid #FF3333')
  

