## 🛠️ Low-Level Packet Crafting with Raw Sockets and PacketGen

Bypass higher‑level abstractions to craft custom Ethernet, IP, and ICMP packets using PacketGen. This is invaluable for network diagnostics, sending malformed packets, or simulating advanced protocols.

```ruby
require 'packetgen'

# Build an ICMP echo request (ping)
pkt = PacketGen.gen('Eth', dst: 'ff:ff:ff:ff:ff:ff')
               .add('IP', src: '192.168.1.100', dst: '192.168.1.1')
               .add('ICMP')

# Set payload and recalculate checksums
data = 'RUBYNETWORK'
pkt.payload = data
pkt.calc

# Send raw packet
pkt.to_w

# Capture response with a filter
response = PacketGen.capture(iface: 'eth0', max: 1, timeout: 5, filter: 'icmp and src host 192.168.1.1')
puts "Received ICMP response: #{response.first.inspect}" if response.first
```