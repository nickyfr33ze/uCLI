import os

# A script meant to mass reformat files or one at a time.
# Written by Nick Friesen and created on 10/8/2024

def rename_files_in_bulk(directory, new_extension):
    # Iterate over each file in the specified directory
    for filename in os.listdir(directory):
        # Split the filename into the base name and the current extension
        base_file, ext = os.path.splitext(filename)
        # Create the new filename with the new extension
        new_filename = f"{base_file}.{new_extension}"
        # Rename the file with the new filename
        os.rename(os.path.join(directory, filename), os.path.join(directory, new_filename))
        # Print a message indicating the file has been renamed
        print(f"Renaming {filename} to {new_filename}")

def main():
    directory = input("Enter the directory of the files to reformat: ")
    new_extension = input("Enter the new file extension (without the dot): ")
    
    if not os.path.isdir(directory):
        print("The provided directory does not exist.")
        return
    
    print(f"Starting to reformat files in {directory} to .{new_extension} files.")
    rename_files_in_bulk(directory, new_extension)
    print("Reformatting completed.")

if __name__ == "__main__":
    main()
