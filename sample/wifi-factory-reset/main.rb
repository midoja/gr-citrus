#!mruby

Usb = Serial.new(0, 115200)

Usb.println System.version

led 0

if (System.useWiFi == 0) then
  Usb.println "WiFi Card can't use."
  System.exit
end

Usb.println "WiFi - Factory reset"
Usb.print WiFi.at "RESTORE"
