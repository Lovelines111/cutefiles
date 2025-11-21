#bash
PID=$(pgrep -f "HuntGame.exe")
ADDRESS="0xEFD53A58"  # Replace with your address

while true; do
  # Read memory value (adjust `readInteger` if needed)
  VALUE=$(sudo scanmem -p "$PID" -c "x $ADDRESS" 2>/dev/null | grep -Po "0x[0-9a-f]+")
  echo "Vault: $VALUE" > /home/luvelyne/nebula/modules/home/vault.txt
  sleep 0.01  # Update every 100ms (~10 FPS)
done
