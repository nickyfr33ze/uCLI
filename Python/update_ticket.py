def multi_line_input(prompt):
    """Read multiple lines of input. Enter a blank line to finish."""
    print(f"{prompt} (press Enter twice to finish):")
    lines = []
    while True:
        line = input()
        if line == "":
            break
        lines.append(line)
    return "\n".join(lines)

what_happened = multi_line_input("What happened?")
steps_taken = multi_line_input("What steps have been taken to resolve the issue?")
next_steps = multi_line_input("What are the next steps to resolve the issue?")
sources = multi_line_input("What sources were used to resolve the issue?")

def print_update():
    print("\n--- Ticket Update ---")
    print(f"What happened:\n{what_happened}\n")
    print(f"Steps taken:\n{steps_taken}\n")
    print(f"Next steps:\n{next_steps}\n")
    if sources and sources.lower() != "none":
        print(f"Sources:\n{sources}\n")
    print("---------------------\n")

if __name__ == "__main__":
    print_update()