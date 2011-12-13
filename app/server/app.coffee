# Server-side Code

exports.actions =
  
  init: (cb) ->
    cb "SocketStream version #{SS.version} is up and running. This message was sent over Socket.IO so everything is working OK."

  sendTimeStamp: (last_count, cb) ->
    session = @session
    counter_key = "pingCounter:" + session.id
    tstamp_failed_key = "websocket_failed_pings:" + session.id
    tstamp_success_key = "websocket_success_pings:" + session.id
    
    R.get counter_key, (err, count) ->
      R.incr "pingCounter:" + session.id, (err, status) ->
        if parseInt(count) == parseInt(last_count)
          R.sadd tstamp_failed_key, Date.now(), (err, status2) ->
              console.log "correct sequence"
              cb parseInt(count) + 1
        else
          R.sadd tstamp_failed_key, Date.now(), (err, status2) ->
            console.log "wrong sequence"
            cb parseInt(count) + 1