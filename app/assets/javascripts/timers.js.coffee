# Kick off the stopwatch code
$ ->
  $("#clock1").stopwatch()

# After hitting save on a timer, grab the value 
# from the stopwatch and write it to hidden input
checkForm = (frm) ->
  frm.submit.disabled = true
  time = $("div.display").text()
  if time
    $("#timer_time").val(time)
    true
  else
    false
window.checkForm = checkForm