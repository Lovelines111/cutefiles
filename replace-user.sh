#bash
# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <old_username> <new_username>"
    exit 1
fi

directory="$1"
old_username="$2"
new_username="$3"

# Verify directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist"
    exit 1
fi

# Safety check
echo "WARNING: This will replace ALL occurrences of '$old_username' with '$new_username' in:"
echo "         $directory"
echo "         and all its subdirectories"
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Escape special characters for sed
escaped_old=$(printf '%s\n' "$old_username" | sed -e 's/[\/&]/\\&/g')
escaped_new=$(printf '%s\n' "$new_username" | sed -e 's/[\/&]/\\&/g')

# Perform the replacement
find "$directory" -type f -exec grep -l "$old_username" {} + | while read -r file; do
    echo "Modifying: $file"
    sed -i.bak "s/${escaped_old}/${escaped_new}/g" "$file" && rm -f "$file.bak"
done

echo "Replacement complete."
