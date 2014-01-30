$ = jQuery

$ ->
  if $(".prettyFile").length
    $(".prettyFile").each ->
      pF = $(this)
      fileInput = pF.find("input[type=\"file\"]")
      fileInput.change ->

        # When original file input changes, get its value, show it in the fake input
        files = fileInput[0].files
        info = ""
        if files.length > 1

          # Display number of selected files instead of filenames
          info = files.length + " files selected"
        else

          # Display filename (without fake path)
          path = fileInput.val().split("\\")
          info = path[path.length - 1]
        pF.find(".input-append input").val info

      pF.find(".input-append").click (e) ->
        e.preventDefault()

        # Make as the real input was clicked
        fileInput.click()
