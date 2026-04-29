if ! sudo -v; then echo "failed to obtain sudo privileges." >&2; exit 1; fi
set -e
echo "downloading last build..."
rm -rf *uf2
gh run download -n firmware
#assuming udiskie is running and auto-mounting..
echo "connect left half using usb and turn it into bootloading mode, waiting 10 seconds..."
sleep 10
echo "copying left half firmware..."
sudo cp "corne_left-nice_nano__zmk-zmk.uf2" /run/media/admin/NICENANO/
echo "connect right half using usb and turn it into bootloading mode, waiting 10 seconds..."
sleep 10
echo "copying right half firmware..."
sudo cp "corne_right-nice_nano__zmk-zmk.uf2" /run/media/admin/NICENANO/
echo "finished."
