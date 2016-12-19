#!/bin/bash
#
# A test topology of four data centers (spine-leaf fabrics), configured as
# four sub-regions, and positioned in the Bay Area (geographically speaking).
#
# Script Configuration:
#
# host     : the controller instance against which this script is run
# nports   : the number of ports to configure on each switch
# sleepfor : the number of seconds to wait for sim to restart

host=${1:-127.0.0.1}
nports=16
sleepfor=5

### start up null provider

onos ${host} null-simulation stop custom
onos ${host} wipe-out please
onos ${host} null-simulation start custom


## unfortunately, it takes a time for the sim to start up
#  this is not ideal...

echo
echo "Sleeping while sim starts up... (${sleepfor} seconds)..."
echo
sleep ${sleepfor}


### Add devices and links
#
# null-create-device <type> <name> <#ports> <latitude> <longitude>
# null-create-link <type> <src> <dst>

onos ${host} <<-EOF

# root region

# CO 1
null-create-device switch SPINE-A-1 ${nports} 37.783197 -122.503738
null-create-device switch SPINE-A-2 ${nports} 37.783972 -122.463738
null-create-device switch SPINE-A-3 ${nports} 37.783972 -122.423738
null-create-device switch SPINE-A-4 ${nports} 37.783972 -122.383738

null-create-device switch LEAF-A-1 ${nports} 37.733972 -122.503738
null-create-device switch LEAF-A-2 ${nports} 37.733972 -122.463738
null-create-device switch LEAF-A-3 ${nports} 37.733972 -122.423738
null-create-device switch LEAF-A-4 ${nports} 37.733972 -122.383738

# Links in CO 1
null-create-link direct LEAF-A-1 SPINE-A-1
null-create-link direct LEAF-A-1 SPINE-A-2
null-create-link direct LEAF-A-1 SPINE-A-3
null-create-link direct LEAF-A-1 SPINE-A-4

null-create-link direct LEAF-A-2 SPINE-A-1
null-create-link direct LEAF-A-2 SPINE-A-2
null-create-link direct LEAF-A-2 SPINE-A-3
null-create-link direct LEAF-A-2 SPINE-A-4

null-create-link direct LEAF-A-3 SPINE-A-1
null-create-link direct LEAF-A-3 SPINE-A-2
null-create-link direct LEAF-A-3 SPINE-A-3
null-create-link direct LEAF-A-3 SPINE-A-4

null-create-link direct LEAF-A-4 SPINE-A-1
null-create-link direct LEAF-A-4 SPINE-A-2
null-create-link direct LEAF-A-4 SPINE-A-3
null-create-link direct LEAF-A-4 SPINE-A-4

# CO 2
null-create-device switch SPINE-B-1 ${nports} 37.458236 -122.252604
null-create-device switch SPINE-B-2 ${nports} 37.458236 -122.212604
null-create-device switch SPINE-B-3 ${nports} 37.458236 -122.172604
null-create-device switch SPINE-B-4 ${nports} 37.458236 -122.132604

null-create-device switch LEAF-B-1 ${nports} 37.418236 -122.252604
null-create-device switch LEAF-B-2 ${nports} 37.418236 -122.212604
null-create-device switch LEAF-B-3 ${nports} 37.418236 -122.172604
null-create-device switch LEAF-B-4 ${nports} 37.418236 -122.132604

# Links in CO 2
null-create-link direct LEAF-B-1 SPINE-B-1
null-create-link direct LEAF-B-1 SPINE-B-2
null-create-link direct LEAF-B-1 SPINE-B-3
null-create-link direct LEAF-B-1 SPINE-B-4

null-create-link direct LEAF-B-2 SPINE-B-1
null-create-link direct LEAF-B-2 SPINE-B-2
null-create-link direct LEAF-B-2 SPINE-B-3
null-create-link direct LEAF-B-2 SPINE-B-4

null-create-link direct LEAF-B-3 SPINE-B-1
null-create-link direct LEAF-B-3 SPINE-B-2
null-create-link direct LEAF-B-3 SPINE-B-3
null-create-link direct LEAF-B-3 SPINE-B-4

null-create-link direct LEAF-B-4 SPINE-B-1
null-create-link direct LEAF-B-4 SPINE-B-2
null-create-link direct LEAF-B-4 SPINE-B-3
null-create-link direct LEAF-B-4 SPINE-B-4

# CO 3
null-create-device switch SPINE-C-1 ${nports} 37.338208 -121.926329
null-create-device switch SPINE-C-2 ${nports} 37.338208 -121.886329
null-create-device switch SPINE-C-3 ${nports} 37.338208 -121.846329
null-create-device switch SPINE-C-4 ${nports} 37.338208 -121.806329

null-create-device switch LEAF-C-1 ${nports} 37.298208 -121.926329
null-create-device switch LEAF-C-2 ${nports} 37.298208 -121.886329
null-create-device switch LEAF-C-3 ${nports} 37.298208 -121.846329
null-create-device switch LEAF-C-4 ${nports} 37.298208 -121.806329

# Links in CO 3
null-create-link direct LEAF-C-1 SPINE-C-1
null-create-link direct LEAF-C-1 SPINE-C-2
null-create-link direct LEAF-C-1 SPINE-C-3
null-create-link direct LEAF-C-1 SPINE-C-4

null-create-link direct LEAF-C-2 SPINE-C-1
null-create-link direct LEAF-C-2 SPINE-C-2
null-create-link direct LEAF-C-2 SPINE-C-3
null-create-link direct LEAF-C-2 SPINE-C-4

null-create-link direct LEAF-C-3 SPINE-C-1
null-create-link direct LEAF-C-3 SPINE-C-2
null-create-link direct LEAF-C-3 SPINE-C-3
null-create-link direct LEAF-C-3 SPINE-C-4

null-create-link direct LEAF-C-4 SPINE-C-1
null-create-link direct LEAF-C-4 SPINE-C-2
null-create-link direct LEAF-C-4 SPINE-C-3
null-create-link direct LEAF-C-4 SPINE-C-4

# CO 4
null-create-device switch SPINE-D-1 ${nports} 37.556826 -122.051926
null-create-device switch SPINE-D-2 ${nports} 37.556826 -122.011926
null-create-device switch SPINE-D-3 ${nports} 37.556826 -121.971926
null-create-device switch SPINE-D-4 ${nports} 37.556826 -121.931926

null-create-device switch LEAF-D-1 ${nports} 37.516826 -122.051926
null-create-device switch LEAF-D-2 ${nports} 37.516826 -122.011926
null-create-device switch LEAF-D-3 ${nports} 37.516826 -121.971926
null-create-device switch LEAF-D-4 ${nports} 37.516826 -121.931926

# Links in CO 4
null-create-link direct LEAF-D-1 SPINE-D-1
null-create-link direct LEAF-D-1 SPINE-D-2
null-create-link direct LEAF-D-1 SPINE-D-3
null-create-link direct LEAF-D-1 SPINE-D-4

null-create-link direct LEAF-D-2 SPINE-D-1
null-create-link direct LEAF-D-2 SPINE-D-2
null-create-link direct LEAF-D-2 SPINE-D-3
null-create-link direct LEAF-D-2 SPINE-D-4

null-create-link direct LEAF-D-3 SPINE-D-1
null-create-link direct LEAF-D-3 SPINE-D-2
null-create-link direct LEAF-D-3 SPINE-D-3
null-create-link direct LEAF-D-3 SPINE-D-4

null-create-link direct LEAF-D-4 SPINE-D-1
null-create-link direct LEAF-D-4 SPINE-D-2
null-create-link direct LEAF-D-4 SPINE-D-3
null-create-link direct LEAF-D-4 SPINE-D-4

# Inter-CO Links
null-create-link direct LEAF-A-4 LEAF-B-1
null-create-link direct LEAF-A-4 LEAF-C-1
null-create-link direct LEAF-A-4 LEAF-D-4
null-create-link direct LEAF-B-1 LEAF-C-1
null-create-link direct LEAF-B-1 LEAF-D-4
null-create-link direct LEAF-C-1 LEAF-D-4

EOF

### Add a host per device
#
# null-create-host <device-id> <host-ip> <latitude> <longitude>

onos ${host} <<-EOF

null-create-host LEAF-A-1 192.168.1.1 37.703972 -122.503738
null-create-host LEAF-A-2 192.168.2.1 37.703972 -122.463738
null-create-host LEAF-A-3 192.168.3.1 37.703972 -122.423738
null-create-host LEAF-A-4 192.168.4.1 37.703972 -122.383738

null-create-host LEAF-B-1 192.168.51.1 37.388236 -122.252604
null-create-host LEAF-B-2 192.168.52.1 37.388236 -122.212604
null-create-host LEAF-B-3 192.168.53.1 37.388236 -122.172604
null-create-host LEAF-B-4 192.168.54.1 37.388236 -122.132604

null-create-host LEAF-C-1 192.168.101.1 37.268208 -121.926329
null-create-host LEAF-C-2 192.168.102.1 37.268208 -121.886329
null-create-host LEAF-C-3 192.168.103.1 37.268208 -121.846329
null-create-host LEAF-C-4 192.168.104.1 37.268208 -121.806329

null-create-host LEAF-D-1 192.168.151.1 37.476826 -122.051926
null-create-host LEAF-D-2 192.168.152.1 37.476826 -122.011926
null-create-host LEAF-D-3 192.168.153.1 37.476826 -121.971926
null-create-host LEAF-D-4 192.168.154.1 37.476826 -121.931926

EOF

### Add regions and associate devices with them
#
# region-add <region-id> <region-name> <region-type> <region-master>
# region-add-devices <region-id> <device-id>...

onos ${host} <<-EOF

region-add c01 SanFrancisco DATA_CENTER 37.75394143914288 -122.45945851660800 ${host}
region-add c02 PaloAlto     DATA_CENTER 37.45466637790734 -122.21838933304870 ${host}
region-add c03 SanJose      DATA_CENTER 37.34425619809433 -121.94768095808017 ${host}
region-add c04 Fremont      DATA_CENTER 37.54328280574901 -122.01205548699211 ${host}

region-add-devices c01 \
    null:0000000000000001 \
    null:0000000000000002 \
    null:0000000000000003 \
    null:0000000000000004 \
    null:0000000000000005 \
    null:0000000000000006 \
    null:0000000000000007 \
    null:0000000000000008 \

region-add-devices c02 \
    null:0000000000000009 \
    null:000000000000000a \
    null:000000000000000b \
    null:000000000000000c \
    null:000000000000000d \
    null:000000000000000e \
    null:000000000000000f \
    null:0000000000000010 \

region-add-devices c03 \
    null:0000000000000011 \
    null:0000000000000012 \
    null:0000000000000013 \
    null:0000000000000014 \
    null:0000000000000015 \
    null:0000000000000016 \
    null:0000000000000017 \
    null:0000000000000018 \

region-add-devices c04 \
    null:0000000000000019 \
    null:000000000000001a \
    null:000000000000001b \
    null:000000000000001c \
    null:000000000000001d \
    null:000000000000001e \
    null:000000000000001f \
    null:0000000000000020 \

regions

EOF

### Add layouts, associating backing regions, and optional parent.
#
# layout-add <layout-id> <region-id(opt)> <parent-layout-id(opt)>

onos ${host} <<-EOF

layout-add lC01 c01
layout-add lC02 c02
layout-add lC03 c03
layout-add lC04 c04

layouts

EOF


### Set up debug log messages for classes we care about

onos ${host} <<-EOF

log:set DEBUG org.onosproject.ui.impl.topo.Topo2ViewMessageHandler
log:set DEBUG org.onosproject.ui.impl.topo.Topo2Jsonifier
log:set DEBUG org.onosproject.ui.impl.UiWebSocket
log:set DEBUG org.onosproject.ui.impl.UiTopoSession
log:list

EOF
