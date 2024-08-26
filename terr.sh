#!/bin/bash

#this fixes Terraria crashing

# Set the memory limit (4GB in this example)
MEMORY_LIMIT="4G"

# Replace this with the actual path to the Terraria executable within your Steam Library
TERRARIA_EXEC="/home/luvelyne/evo/SteamLibrary/steamapps/common/Terraria/Terraria.bin.x86_64"

# Create a transient scope with the memory limit and run the steam --run command inside it
systemd-run --user --scope -p "MemoryMax=${MEMORY_LIMIT}" \
  sh -c "steam --run ${TERRARIA_EXEC}"
