App.online = App.cable.subscriptions.create "OnlineChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected to OnlineChannel')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected to OnlineChannel')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('Received online: ' + data.users.join(', '))
    $('#online').text(data.users.join(' '))
