import sys

def count_tokens(input_string):
    # Split the input string into tokens using whitespace as delimiter
    tokens = input_string.split()
    # Count the number of tokens
    num_tokens = len(tokens)
    return num_tokens

# Check if the user has provided the input string
if len(sys.argv) < 2:
    print("Usage: python script.py <input_string>")
    sys.exit(1)

# Get the input string from command line arguments
input_string = " ".join(sys.argv[1:])
num_tokens = count_tokens(input_string)
print(num_tokens)