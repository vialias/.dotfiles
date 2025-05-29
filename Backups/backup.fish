#!/usr/bin/env fish

# 1. Variables
set SRC /home/luc4/
# date +%F yields YYYY-MM-DD
set DATE (date +%F)_fw13
set DEST /mnt/Backup/$DATE

# 2. Ensure the destination exists
if not test -d $DEST
    echo "Creating backup directory: $DEST"
    mkdir -p $DEST
end

# 3. Run rsync
echo "Starting backup from $SRC to $DEST"
sudo rsync -aAXHv --progress $SRC $DEST

echo "Backup complete!"

