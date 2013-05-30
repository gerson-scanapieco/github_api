jQuery ->
  $("#repositoryURL").blur ->
    if this.value.match("git:\/\/github.com\/[a-z]*\/[a-z]*.git")
      $("#url_error").text("")
    else
      $("#url_error").text("Invalid URL")
  $("#startDate").blur ->
    if this.value.match("^$|0?([1-9]|[12][0-9]|3[01])-(0?[1-9]|1[012])-((19|20)[0-9][0-9])")
      $("#start_date_error").text("")
    else
      $("#start_date_error").text("Invalid date.")
  $("#endDate").blur ->
    if this.value.match("^$|0?([1-9]|[12][0-9]|3[01])-(0?[1-9]|1[012])-((19|20)[0-9][0-9])")
      $("#end_date_error").text("")
    else
      $("#end_date_error").text("Invalid date.")



