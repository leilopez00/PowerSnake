# Snake Game

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Requirements](#requirements)
4. [Setup Instructions](#setup-instructions)
5. [How to Play](#how-to-play)
6. [Troubleshooting](#troubleshooting)
7. [License](#license)

---

## Overview <a name="overview"></a>
The Snake Game is a classic arcade-style game implemented in PowerShell. The player controls a snake that grows in length as it consumes food. The objective is to score as many points as possible by eating food while avoiding collisions with the walls or the snake's own body.

This project includes:
- A `snake.ps1` script containing the game logic.
- A `launch.ps1` script to start the game.
- A compiled `SnakeLauncher.exe` for easy execution.

---

## Features <a name="features"></a>
- **Dynamic Speed**: The snake starts 3x faster and speeds up by 2x each time it eats food.
- **Game Over Screen**: Displays "Game Over" and the final score when the snake collides with the wall or itself.
- **Debugging Support**: Includes a `debug.log` file for troubleshooting issues.
- **Customizable Grid**: The game grid is 30x10 with padding for better visibility.
- **Executable Launcher**: Provides a standalone `.exe` file (`SnakeLauncher.exe`) for launching the game without manually running scripts.

---

## Requirements <a name="requirements"></a>
To run this game, you need the following:
1. **Operating System**: Windows (tested on Windows 10/11).
2. **PowerShell**: Version 5.1 or later (PowerShell Core 7.x is also supported).
3. **Optional**: Administrative privileges (if adjusting execution policies).

---

## Setup Instructions <a name="setup-instructions"></a>
### Step 1: Download the Files
Download the following files from the repository:
- `snake.ps1`: The main game script.
- `launch.ps1`: The launcher script to start the game.
- `SnakeLauncher.exe`: The compiled executable for launching the game.

### Step 2: Place Files in the Same Directory
Ensure all files are located in the same folder. For example:
```
C:\Users\admin\Documents\Scripts\
    ├── launch.ps1
    ├── snake.ps1
    └── SnakeLauncher.exe
```

### Step 3: Run the Game
#### Option 1: Using `SnakeLauncher.exe`
1. Double-click `SnakeLauncher.exe` to start the game.
2. If prompted by Windows Defender or SmartScreen, click **More Info** and select **Run Anyway**.

#### Option 2: Using `launch.ps1`
1. Open PowerShell and navigate to the folder containing the scripts:
   ```powershell
   cd C:\Users\admin\Documents\Scripts
   ```
2. Run the launcher script:
   ```powershell
   .\launch.ps1
   ```

#### Option 3: Running `snake.ps1` Directly
1. Open PowerShell and navigate to the folder containing the scripts:
   ```powershell
   cd C:\Users\admin\Documents\Scripts
   ```
2. Run the game directly:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\snake.ps1
   ```

---

## How to Play <a name="how-to-play"></a>
1. Use the arrow keys (`Up`, `Down`, `Left`, `Right`) to control the snake.
2. Eat the red food (`*`) to grow the snake and increase your score.
3. Avoid colliding with the walls or the snake's own body.
4. The game ends when a collision occurs. A "Game Over" screen will display your final score.
5. Press `Enter` to exit the game after it ends.

---

## Troubleshooting <a name="troubleshooting"></a>
### Issue 1: `.exe` File Doesn't Work
- **Cause**: Path resolution or missing files.
- **Solution**:
  1. Ensure `SnakeLauncher.exe` and `snake.ps1` are in the same directory.
  2. Check the `debug.log` file for errors.
  3. Run the game using `launch.ps1` or `snake.ps1` directly to verify functionality.

### Issue 2: Execution Policy Restrictions
- **Cause**: PowerShell's execution policy blocks script execution.
- **Solution**:
  1. Temporarily bypass the execution policy:
     ```powershell
     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
     ```
  2. Alternatively, include `-ExecutionPolicy Bypass` when running the script:
     ```powershell
     powershell -ExecutionPolicy Bypass -File .\snake.ps1
     ```

### Issue 3: Missing `snake.ps1`
- **Cause**: The game script is not found.
- **Solution**:
  1. Verify that `snake.ps1` is in the same directory as `SnakeLauncher.exe`.
  2. Check the `debug.log` file for the expected location of `snake.ps1`.

### Issue 4: Game Runs Slowly
- **Cause**: High system load or outdated hardware.
- **Solution**:
  1. Close unnecessary applications to free up system resources.
  2. Ensure the script is compiled into an `.exe` for optimal performance.

---

## License <a name="license"></a>
This project is licensed under the **MIT License**. Feel free to use, modify, and distribute the code as needed.

---

## Contact
For questions, feedback, or support, please contact the developer:
- Email: [your-email@example.com]
- GitHub: [Your GitHub Profile]

---

This `README.md` file ensures users have all the information they need to set up and play the game. You can customize it further by adding your contact details, GitHub repository link, or additional sections like "Contributing" or "Acknowledgments." Let me know if you’d like to make any changes!
