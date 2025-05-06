from docx import Document
import time
from time import sleep

# Create a new Document
doc = Document()
# Save the document
# Ask the user for the file name
file_name = input("Please enter the name for the document (without .docx extension): ")
file_name += ".docx"
print("-----------------------------")
sleep(0.5)
print(f"Document will be saved as '{file_name}'")
sleep(0.5)
print("-----------------------------")

# Add the content to the document in the quotations below:
content = input("Please enter the content you want to add to the document: ")
# Example content
# content = """This is an example of a document created using Python.

# Add the content to the document
doc.add_paragraph(content)
# Save the document with the user-provided name
doc.save(file_name)
print("-----------------------------")
sleep(0.5)
# Print a message to the user
print(f"Document has been saved as {file_name}")
sleep(0.5)
print("-----------------------------")
restart = input("Do you want to restart the program? (yes/no): ").strip().lower()
if restart != "yes":
    print("Exiting program...")
    sleep(1)
    exit()
elif restart == "yes":
    print("Restarting the program...")
    sleep(1)
    # Restart the script
    exec(open(__file__).read())