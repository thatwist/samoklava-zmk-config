if ! sudo -v; then echo "failed to obtain sudo privileges." >&2; exit 1; fi

set -e

echo "downloading last build..."
rm -rf *uf2
gh run download -n firmware

echo "please connect left half using usb and turn it into bootloading mode, waiting 10 seconds..."
sleep 10
echo "mounting kbd flash..."
sudo umount -q /mnt/flash || true
echo "lsblk | grep sd:"
lsblk | grep sd
sudo mount /dev/sda /mnt/flash
echo "mounted kbd flash block:"
lsblk | grep sd
echo "copying left half firmware..."
sudo cp "corne_left-nice_nano_v2-zmk.uf2" /mnt/flash/
echo "unmounting kbd flash..."
sudo umount /mnt/flash

echo "please connect right half using usb and turn it into bootloading mode, waiting 10 seconds..."
sleep 10
echo "mounting kbd flash..."
sudo mount /dev/sda /mnt/flash
echo "mounted kbd flash block:"
lsblk | grep sd
echo "copying right half firmware..."
sudo cp "corne_right-nice_nano_v2-zmk.uf2" /mnt/flash/
echo "unmounting kbd flash..."
sudo umount /mnt/flash

echo "finished."
