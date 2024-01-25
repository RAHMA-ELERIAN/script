#/bin/bash
#backup home dir


backup_dir="/home/mercy/backup"

backup_filename="home_backup.tar.gz"

source_dir="/home/mercy"

#  the backup
tar -czvf "$backup_dir/$backup_filename" "$source_dir"
#-c: Create a new archive.
#-z: Compress the archive.
#-v:  show the progress of the operation.
#-f: Use archive file specified. It should be followed by the name of the archive file
# Check  success
if [ $? -eq 0 ]; then
    echo "Backup success , $backup_dir/$backup_filename"
else
    echo "Backup failed!"
fi




