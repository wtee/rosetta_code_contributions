// Io example for http://rosettacode.org/wiki/Hello_world/Web_server
WebRequest := Object clone do(
    handleSocket := method(aSocket,
      aSocket streamWrite("Goodbye, World!")
      aSocket close
    )
)
 
WebServer := Server clone do(
    setPort(8080)
    handleSocket := method(aSocket,
        WebRequest clone asyncSend(handleSocket(aSocket))
    )
)
 
WebServer start