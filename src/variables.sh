PT_CONFIG="config.txt"

# load()
#
# Load parameters from disk.
function load {
  source "$PT_CONFIG"
}

# save()
#
# Save the current parameters to disk.
function save {
  rm "$PT_CONFIG"
  touch "$PT_CONFIG"
  echo "PT_DEVICE=$PT_DEVICE" >> "$PT_CONFIG"
  echo "PT_TARGET=$PT_TARGET" >> "$PT_CONFIG"
}
