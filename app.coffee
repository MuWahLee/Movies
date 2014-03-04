"use strict"

$ ->

  $("input").focus()

  $("form").on "submit", (event) ->
    event.preventDefault()

    searchTerm = $("input").val()

    movieData = $.ajax
      url: "http://www.omdbapi.com/"
      method: "get"
      data: {s: searchTerm}
      dataType: "json"

    movieData.done (data) ->
      $("input").val("")
      $("result").html("")

      # console.log data["Search"]

      for movie in data["Search"]
        li =  ($($ "<li data-imdb=\"" + movie.imdbID + "\">" + movie.Title + "</li>")).addClass("motionPicture")
        console.log li
        $(".result").append(li)

      $("li.motionPicture").on "click", li, (event) ->
        movieID = @.dataset.imdb
        # console.log movieID

        motionPictureData = $.ajax
          url: "http://www.omdbapi.com/"
          method: "get"
          data: {i: movieID, tomatoes: true}
          dataType: "json"

        motionPictureData.done (data) ->
          console.log data
          data.select()
          # empty()
          $(".plot").append(data.Plot)
          $






          #   section = ($($ "<section>About</section>")).addClass("movieInfo")
          #   console.log section
          #   $().append(section)

          #   rottenTomatoes = ($($ "<p>" + </section>")).addClass("movieInfo")

          # #   ul =
          # #   $(@).append(ul)
