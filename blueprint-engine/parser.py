import os

def parse_scenario(input_data):
    scenarios = input_data.get("scenarios", [])
    project_tags = input_data.get("tags", {})
    region = input_data.get("region", "eastus")

    tf_blocks = []

    for scenario in scenarios:
        scenario_path = os.path.join("scenarios", scenario)
        tf_file = os.path.join(scenario_path, "main.tf")

        if os.path.exists(tf_file):
            with open(tf_file, 'r') as tf:
                content = tf.read()
                # Inject user tags or region dynamically
                content = content.replace("${region}", region)
                for key, value in project_tags.items():
                    content = content.replace(f"${{{key}}}", value)
                tf_blocks.append(content)
        else:
            print(f"⚠️ Warning: Scenario {scenario} not found")

    return "\n\n".join(tf_blocks)
