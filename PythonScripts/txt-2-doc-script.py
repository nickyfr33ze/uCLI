from docx import Document
import time

# Create a new Document
doc = Document()
# Save the document
# Ask the user for the file name
file_name = input("Please enter the name for the document (without .docx extension): ")
file_name += ".docx"

# Add the content to the document in the quotations below:
content = """
Testing Document
"""

# Add the content to the document
doc.add_paragraph(content)
# Save the document with the user-provided name
doc.save(file_name)
print("-----------------------------")
# Print a message to the user
print(f"Document has been saved as {file_name}")
print("-----------------------------")