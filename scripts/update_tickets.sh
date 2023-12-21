#!/bin/bash
readme_file="README.md"
update_ticket_count() {
    current_count=$(grep -oP '(?<=Tickets: )\d+' "$readme_file")
    
    if [ "$current_count" -eq 0 ]; then
        echo "Tickets are over! Refilling tickets..."
        new_count=20 
    else
        echo "Current ticket count: $current_count"
        new_count=$((current_count - 5))
    fi

    echo "Updated ticket count: $new_count"
    sed -i "s/Tickets: .*/Tickets: $new_count/" "$readme_file"
}

update_ticket_count
