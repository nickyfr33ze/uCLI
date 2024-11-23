from docx import Document

# Create a new Document
doc = Document()
# Save the document
# Ask the user for the file name
file_name = input("Please enter the name for the document (with .docx extension): ")

# Add the content to the document in the quotations below:
content = """

"""

# Add the content to the document
doc.add_paragraph(content)

# Save the document with the user-provided name
doc.save(file_name)