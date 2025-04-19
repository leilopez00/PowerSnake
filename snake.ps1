# Define constants
$Width = 30
$Height = 10
$InitialDelay = 600  # Initial delay in milliseconds (before applying 3x speedup)
$SpeedIncreaseFactor = 0.5  # Reduce delay by this factor when eating food

# Initialize game variables
[System.Collections.ArrayList]$Snake = @([PSCustomObject]@{X=15; Y=5})  # Start snake in the middle
$Direction = "Right"  # Initial direction
$Food = @{X=5; Y=5}   # Initial food position
$Score = 0

# Function to clear the screen
function Clear-Screen {
    Write-Host "$([System.Environment]::NewLine * $Height)" -NoNewline
}

# Function to draw the game grid
function Draw-Grid {
    Clear-Screen

    # Draw the grid content
    for ($y = 0; $y -lt $Height; $y++) {
        for ($x = 0; $x -lt $Width; $x++) {
            if ($Snake | Where-Object { $_.X -eq $x -and $_.Y -eq $y }) {
                Write-Host "O" -NoNewline -ForegroundColor Green  # Snake segment
            }
            elseif ($Food.X -eq $x -and $Food.Y -eq $y) {
                Write-Host "*" -NoNewline -ForegroundColor Red  # Food
            }
            else {
                Write-Host "." -NoNewline  # Empty space
            }
        }
        Write-Host
    }

    # Display the score
    Write-Host "Score: $Score"
}

# Function to move the snake
function Move-Snake {
    # Calculate new head position
    $Head = $Snake[0]
    $NewHead = switch ($Direction) {
        "Up"    { [PSCustomObject]@{X=$Head.X; Y=($Head.Y - 1)} }
        "Down"  { [PSCustomObject]@{X=$Head.X; Y=($Head.Y + 1)} }
        "Left"  { [PSCustomObject]@{X=($Head.X - 1); Y=$Head.Y} }
        "Right" { [PSCustomObject]@{X=($Head.X + 1); Y=$Head.Y} }
    }

    # Check for collisions
    if ($NewHead.X -lt 0 -or $NewHead.X -ge $Width -or $NewHead.Y -lt 0 -or $NewHead.Y -ge $Height) {
        return $false  # Out of bounds
    }
    if ($Snake | Where-Object { $_.X -eq $NewHead.X -and $_.Y -eq $NewHead.Y }) {
        return $false  # Collision with itself
    }

    # Add new head (using ArrayList's Insert method)
    $null = $Snake.Insert(0, $NewHead)

    # Check if food is eaten
    if ($NewHead.X -eq $Food.X -and $NewHead.Y -eq $Food.Y) {
        $Script:Score += 1
        do {
            $Food.X = Get-Random -Minimum 0 -Maximum $Width
            $Food.Y = Get-Random -Minimum 0 -Maximum $Height
        } while ($Snake | Where-Object { $_.X -eq $Food.X -and $_.Y -eq $Food.Y })
    }
    else {
        # Remove tail (using ArrayList's RemoveAt method)
        $null = $Snake.RemoveAt($Snake.Count - 1)
    }

    return $true
}

# Main game loop
Draw-Grid

# Start with 3x faster speed
$CurrentDelay = $InitialDelay / 3

while ($true) {
    # Handle user input (only process if a key is available)
    if ([Console]::KeyAvailable) {
        $Key = [Console]::ReadKey($true).Key
        switch ($Key) {
            "UpArrow"    { if ($Direction -ne "Down")  { $Direction = "Up" } }
            "DownArrow"  { if ($Direction -ne "Up")    { $Direction = "Down" } }
            "LeftArrow"  { if ($Direction -ne "Right") { $Direction = "Left" } }
            "RightArrow" { if ($Direction -ne "Left")  { $Direction = "Right" } }
        }
    }

    # Move the snake
    if (-not (Move-Snake)) {
        # Game Over Screen
        Draw-Grid
        Write-Host "Game Over! Final Score: $Score" -ForegroundColor Yellow

        # Prompt the user to press Enter to exit
        Read-Host "Press Enter to exit..."
        break
    }

    # Dynamically adjust delay based on food consumption
    if ($Score -gt 0) {
        $CurrentDelay = $InitialDelay / 3 * [Math]::Pow($SpeedIncreaseFactor, $Score)
        $CurrentDelay = [Math]::Max($CurrentDelay, 50)  # Ensure the delay doesn't drop below 50ms
    }

    Start-Sleep -Milliseconds $CurrentDelay

    # Update the grid
    Draw-Grid
}