pusher = new Pusher('54588be462ee98f5db66')
channel = pusher.subscribe('Snappygram')

channel.bind('new_snap', (data)->
  tags = ''
  for tag in data.tags
    tags += "<a href=\"/tags/#{tag.id}\">#{tag.text}</a>"
  newHTML = """
    <li><img src="#{data.src}"><p>#{data.username}</p><p>#{data.description}</p><p>#{tags}</p></li>
  """
  $("#snaps-container").prepend(newHTML)
)