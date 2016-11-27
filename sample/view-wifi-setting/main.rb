#!mruby

Usb = Serial.new(0, 115200)

Usb.println System.version

led 0

if (System.useWiFi == 0) then
  Usb.println "WiFi Card can't use."
  System.exit
end

Usb.println "WiFi - AT commands echo: switch echo on"
Usb.print WiFi.at "ATE1", 1

Usb.println "WiFi - Restart module"
Usb.println WiFi.at "RST"

Usb.println "WiFi - Return the sleep mode"
Usb.print WiFi.at "SLEEP?"

Usb.println "WiFi - Return the current WiFi mode"
Usb.print WiFi.at "CWMODE_CUR?"

Usb.println "WiFi - Return the default WiFi mode"
Usb.print WiFi.at "CWMODE_DEF?"

Usb.println "WiFi - Return the configuration of current soft AP"
Usb.print WiFi.at "CWSAP_CUR?"

Usb.println "WiFi - Return the configuration of default soft AP"
Usb.print WiFi.at "CWSAP_DEF?"

Usb.println "WiFi - Return DHCP disabled or enabled currently"
Usb.print WiFi.at "CWDHCP_CUR?"

Usb.println "WiFi - Return DHCP disabled or enabled in default setting"
Usb.print WiFi.at "CWDHCP_DEF?"

Usb.println "WiFi - Return the MAC Address of station currently"
Usb.print WiFi.at "CIPSTAMAC_CUR?"

Usb.println "WiFi - Return the MAC Address of station in default setting"
Usb.print WiFi.at "CIPSTAMAC_DEF?"

Usb.println "WiFi - Return the MAC Address of AP currentrly"
Usb.print WiFi.at "CIPAPMAC_CUR?"

Usb.println "WiFi - Return the MAC Address of AP default setting"
Usb.print WiFi.at "CIPAPMAC_DEF?"

Usb.println "WiFi - Return the IP Address of station currently"
Usb.print WiFi.at "CIPSTA_CUR?"

Usb.println "WiFi - Return the IP Address of station in default setting"
Usb.print WiFi.at "CIPSTA_DEF?"

Usb.println "WiFi - Return the IP Address of softAP currently"
Usb.print WiFi.at "CIPAP_CUR?"

Usb.println "WiFi - Return the IP Address of softAP in default setting"
Usb.print WiFi.at "CIPAP_DEF?"
