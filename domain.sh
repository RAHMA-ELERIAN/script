#!/bin/bash

tools=(subfinder amass assetfinder)  # Array of tools to use

usage() {
    echo "Usage: $0 <domain_file> <iterations>"
    exit 1
}

if [ "$#" -ne 2 ]; then
    usage
fi

domain_file="$1"
iterations="$2"

all_subdomains=()

for ((i=0; i<iterations; i++)); do
    new_subdomains=()
    for domain in "${all_subdomains[@]}"; do
        for tool in "${tools[@]}"; do
            # Use a temporary file to capture each tool's output
            temp_file=$(mktemp)
            $tool $domain > "$temp_file"
            output=$(cat "$temp_file")
            rm -f "$temp_file"

            # Add new subdomains, ensuring uniqueness
            for subdomain in $output; do
                if [[ ! " ${all_subdomains[@]} " =~ " $subdomain " ]]; then
                    new_subdomains+=("$subdomain")
                fi
            done
        done
    done
    all_subdomains=("${new_subdomains[@]}")
done

# Save subdomains to a file
echo "${all_subdomains[@]}" > subdomains.txt
echo "Subdomains saved to subdomains.txt"
