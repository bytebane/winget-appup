# WingetAppUp: Manage Your Windows Apps Effortlessly

&numsp;&numsp;&numsp;&numsp;**Upgrade** and **install** your favorite Windows applications with ease! **WingetAppUp** leverages the power of `winget` to automate these tasks, keeping your software up-to-date and saving you valuable time.

## Key Features

- ***Automatic Installation & Updates***: Finds and installs missing applications or applies updates to existing ones as per your configuration.
- ***Unattended Operation***: Run the script once, and it handles everything in the background, displaying progress messages in the console.
- ***Simple Configuration***: Customize the applications you want to manage through the user-friendly [apps.json](./apps.json) configuration file.
- ***Security-Focused***: `WingetAppUp` utilizes the official `winget` package manager, ensuring safe and reliable updates from trusted sources.

## Getting Started

### Prerequisites

- ***Windows 10 or Later***: Ensure your system is running Windows 10 or a newer version.
- ***winget Installed***: Check if `winget` is installed on your system with `winget`, if not, download `winget` from [Microsoft Store](https://aka.ms/getwinget) and install it ([learn.microsoft.com](https://learn.microsoft.com/en-us/windows/package-manager/winget/)).
- ***Administrative Privileges***: Run PowerShell as Administrator for complete functionality.

### Configuration

***1. Locate apps.json***: This file specifies the applications you want to manage.

***2. Edit apps.json***: Add the application IDs (found in the Microsoft Store) of the apps you want WingetAppUp to handle.

>Example [apps.json](./apps.json):

```json
{
    "apps": [
        "Google.Chrome",
        "Mozilla.Firefox",
        "7zip.7zip",
        ...
    ]
}
```
> **Note**: Run the `winget upgrade` command to get the list of ***applications Ids*** with updates.

## Usage

- ***Open PowerShell (Admin)***: Press `Win + X`, select `Windows PowerShell (Admin)` or `Windows Terminal (Admin)` or `Terminal (Admin)` and click ***`Yes`*** for **User Account Control (UAC)**.
- ***Navigate to Project Directory***: Use the `cd` command to reach the directory containing the script.

    ```pwsh
    cd 'C:\path\to\winget-appup'
    ```

- ***Run the Script***: Execute the script

    ```pwsh
    .\script.ps1
    ```

### Script Functionality

- ***winget Check***: **Verifies** `winget` installation; exits with an error message if not found.
- ***winget Update (Optional)***: **Ensures** `winget` itself is up-to-date before proceeding. (This functionality remains in the script for potential future updates.)
- ***Read App List***: **Retrieves** application IDs for update/installation from [apps.json](./apps.json).
- ***Smart App Management***:
  - **Installs** applications not found on your system.
  - **Updates** existing applications with the latest versions.
- ***Progress Messages***: **Displays** clear messages in the ***console*** to keep you informed.

## Troubleshooting

- ***Ensure*** `winget` is installed and accessible in **PowerShell**.
- ***Verify*** the [apps.json](./apps.json) file is formatted correctly and located in the same directory as the script.
- ***Confirm*** you are running **PowerShell** with ***administrative privileges***.

## Resources

For more information on `winget` and its capabilities, refer to the [official documentation](https://learn.microsoft.com/en-us/windows/package-manager/winget/)

### WingetAppUp - Streamline your Windows application updates and keep your software fresh!
