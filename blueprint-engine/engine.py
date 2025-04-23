import json
import sys
from . import parser

def generate_blueprint(input_file):
    with open(input_file, 'r') as f:
        input_data = json.load(f)

    tf_code = parser.parse_scenario(input_data)

    with open("blueprints/generated-landingzone.tf", "w") as tf_file:
        tf_file.write(tf_code)

    print("✅ Blueprint generated at blueprints/generated-landingzone.tf")

if __name__ == "__main__":
    if len(sys.argv) != 3 or sys.argv[1] != "--input":
        print("Usage: python3 engine.py --input <input_json_file>")
        sys.exit(1)

    input_file = sys.argv[2]
    generate_blueprint(input_file)