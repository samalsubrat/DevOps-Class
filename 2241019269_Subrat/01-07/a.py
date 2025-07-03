import csv

# Data with extra spaces and inconsistent delimiters
data = [
    ["Name", "Age", "Location", "Salary"],
    ["John   ", " 28 ", " New York  ", " 50000"],
    ["  Alice ", " 34", "  Los Angeles", "  75000 "],
    ["Bob", " 45 ", "Chicago ", "  62000"],
    ["  Charlie ", " 39 ", " San Francisco  ", " 85000 "],
    ["  Eve  ", " 29 ", "   Miami ", " 54000"]
]

# Define file path
file_path = "example_with_inconsistent_csv.csv"

# Writing data to CSV file
with open(file_path, mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerows(data)

# For compatibility with older Python versions
print("CSV file saved as {}".format(file_path))

