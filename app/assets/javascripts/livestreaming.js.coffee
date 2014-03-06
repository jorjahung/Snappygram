pusher = new Pusher('1460f55072d4b5c355e8')
channel = pusher.subscribe('Snappygram')

channel.bind('new_snap', (data)->
  tags = ''
  for tag in data.tags
    tags += "<p><a href=\"/tags/#{tag.id}\">#{tag.text}</a> </p>"
  newHTML = """
    <li><img src="#{data.src}"><p>#{data.username}</p><p>#{data.description}</p>#{tags}</li>
  """
  $("#snaps-container").prepend(newHTML)
)