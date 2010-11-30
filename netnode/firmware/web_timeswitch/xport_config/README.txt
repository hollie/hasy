The .rec file in this folder is a setup record file generated with
Lantronix DeviceInstaller v4.2

Use it to load an initial configuration in the XPORT that is compatible 
with this firmware. DHCP is enabled.

After loading the setup record, please review the XPORT setting to configure
a hostname that suits your network configuration.

If the restoration of the .rec file doesn't work, the most important settings are:

DHCP enabled
CPU performance 'low'

Serial settings:
 baudrate: 9600 8N1, no flow control

Connection:
 Accept incoming: yes
 Active Connect: Manual Connection
 Modem mode: none
 Show IP after ring: yes

 Connect Response: char response
 Use hostlist: no

 Hard Disconnect: yes, after 2 minutes

