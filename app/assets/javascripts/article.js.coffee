# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# uses js.tinysort to sort posts
sortPosts = ->
  $('.article-container > .article').tsort('.vote-count', { order: 'desc' })

$ ->
  sortPosts()

# websocket update for vote-count. Note: capital S needed in WebSocketRails!
dispatcher = new WebSocketRails(window.location.host + '/websocket')

channel = dispatcher.subscribe('vote_count')
channel.bind 'update', (article) ->
  console.log('Hi')
  $(".vote-count[data-id=#{article.id}]").text(article.count)

  sortPosts()




