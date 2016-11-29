#!mruby

Usb = Serial.new(0, 115200)

Usb.println System.version

led 0

if (System.useWiFi == 0) then
  Usb.println "error: WiFi Card can't use."
  System.exit
end

Usb.println "WiFi - Output AT command's response to serial 0"
WiFi.serialOut 1, 0

Usb.println "WiFi - AT commands echo: switch echo on"
WiFi.at "ATE1", 1

Usb.println "WiFi - Set a WiFi mode as a station mode"
WiFi.setMode 1

Usb.println "WiFi - enable station DHCP"
WiFi.at "CWDHCP_CUR=1,1"
WiFi.at "CWDHCP_CUR?"

Usb.println "WiFi - Dsconnect from AP"
WiFi.disconnect

Usb.println "WiFi - Connect to AP, for current"
connectionResponse = WiFi.connect "abc", "<password>"

if !connectionResponse.include? "OK" then
  Usb.println "error: Wifi - Can not connect to AP."
  System.exit
end

Usb.println "WiFi - Return the IP address of station"
WiFi.at "CIPSTA_CUR?"

Usb.println "WiFi - Get local IP address"
WiFi.ipconfig

Usb.println "WiFi - Function Ping"
WiFi.at 'PING="www.This-URI-do-not-exist.co.jp"'
WiFi.at 'PING="news.yahoo.co.jp"'
WiFi.at 'PING="192.168.3.1"'
WiFi.at 'PING="192.168.3.2"'
WiFi.at 'PING="192.168.3.3"'

delay 30000
