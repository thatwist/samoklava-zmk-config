bluetoothctl --monitor --agent NoInputNoOutput --timeout 10 <<EOF
power on
#agent NoInputNoOutput
default-agent
remove F8:02:1B:C5:C6:79
scan.rssi -70
scan.pattern Samoklava
scan.transport le
scan.auto-connect on
scan.duplicate-data on
monitor.set-rssi-threshold -70 -10
scan le
#sleep 5
#scan off
#pair F8:02:1B:C5:C6:79
#sleep 5
#trust F8:02:1B:C5:C6:79
#sleep 5
#connect F8:02:1B:C5:C6:79
#sleep 5
#agent off
#quit
EOF
[ $? -eq 0 ] && echo "finished" || echo "error"
