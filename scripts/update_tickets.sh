#!/bin/bash

# File path to store the ticket count in README.md
readme_file="README.md"

# Function to update ticket count
update_ticket_count() {
    current_count=$(grep -oP '(?<=Tickets: )\d+' "$readme_file")
    
    if [ "$current_count" -eq 0 ]; then
        echo "Tickets are over! Refilling tickets..."
        new_count=20  # Refill the tickets to 20 or any desired initial count
        echo "Refilling complete. Current ticket count: $new_count"
    else
        echo "Current ticket count: $current_count"
        new_count=$((current_count - 5))
    fi

    echo "Updated ticket count: $new_count"
    sed -i "s/Tickets: .*/Tickets: $new_count/" "$readme_file"
}

# Run the function to update ticket count
update_ticket_count
