#!/usr/bin/env python3

import json
import json5


def read_jsonc(path):
    with open(path, 'r', encoding='utf-8') as file:
        return json5.load(file)

# Merge 2 json objects into 1 object
def merge_json(file1, file2):
    return file1 | file2

# Pack 2 json objects into list
def pack_json(file1, file2):
    return [file1, file2]

def main():
    commonConfigSrc = read_jsonc("/home/slava9096/.config/waybar/waybar_config/common.jsonc")
    monitor1ConfigSrc = read_jsonc("/home/slava9096/.config/waybar/waybar_config/monitor1.jsonc")
    monitor2ConfigSrc = read_jsonc("/home/slava9096/.config/waybar/waybar_config/monitor2.jsonc")

    monitor1Config = merge_json(monitor1ConfigSrc, commonConfigSrc)
    monitor2Config = merge_json(monitor2ConfigSrc, commonConfigSrc)

    # Write final config
    with open("/home/slava9096/.config/waybar/config.jsonc", "w", encoding="utf-8") as config:
        print(json.dump(pack_json(monitor1Config, monitor2Config), config, indent=4))

    print("✅ Merged config saved to config.jsonc")

if __name__ == "__main__":
    main()
