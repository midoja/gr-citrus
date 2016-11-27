#!mruby

Usb = Serial.new(0, 115200)

Usb.println System.version

led 0

if (System.useWiFi == 0) then
  Usb.println "error: WiFi Card can't use."
  System.exit
end

Usb.println "WiFi - AT commands echo: switch echo on"
Usb.print WiFi.at "ATE1", 1

Usb.println "WiFi - Set a WiFi mode as a station mode"
Usb.print WiFi.at "CWMODE=1"

Usb.println "WiFi - enable station DHCP"
Usb.println WiFi.at "CWDHCP_CUR=1,1"
Usb.println WiFi.at "CWDHCP_CUR?"

wifiConnection = false
10.times do
  Usb.println "WiFi - Dsconnect from AP"
  Usb.print WiFi.at "CWQAP"
  Usb.println "WiFi - Connect to AP, for current"
  if (WiFi.at('CWJAP_CUR="333333333333-2G","<password>"').to_s.include?("OK")) then
    wifiConnection = true
    break
  end
end

if (!wifiConnection) then
  Usb.println "error: Wifi - Can not connect to AP."
  System.exit
end

Usb.println "WiFi - Return the IP address of station"
Usb.print WiFi.at "CIPSTA_CUR?"

Usb.println "WiFi - Get local IP address"
Usb.print WiFi.at "CIFSR"

Usb.println "WiFi - Function Ping"
Usb.print WiFi.at 'PING="www.This-URI-do-not-exist.co.jp"'
Usb.print WiFi.at 'PING="news.yahoo.co.jp"'
Usb.print WiFi.at 'PING="192.168.3.1"'
Usb.print WiFi.at 'PING="192.168.3.2"'
Usb.print WiFi.at 'PING="192.168.3.3"'

delay 30000
