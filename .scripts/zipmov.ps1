# Array of mod folders
$MOD_FOLDERS = @("space_age_galore", "angels_galore", "vanilla_galore_continued", "galore_lib")

# Get the username from the environment variable
$USER_NAME = [System.Environment]::GetEnvironmentVariable("USERPROFILE").Split("\")[-1]

# Destination folder for Factorio mods (Windows path, escaped properly)
$DEST_DIR = "C:\Users\$USER_NAME\AppData\Roaming\Factorio\mods"

# Check if 7z is installed
if (-not (Get-Command 7z -ErrorAction SilentlyContinue)) {
    Write-Host "7z is not installed or not found in the PATH. Please install it and try again."
    exit 1
}

# Check if jq is installed
if (-not (Get-Command jq -ErrorAction SilentlyContinue)) {
    Write-Host "jq is not installed or not found in the PATH. Please install it and try again."
    exit 1
}

# Navigate to the parent directory of the script
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location "$SCRIPT_DIR\.."

# Function to remove all occurrences of a mod (including all versions)
function Remove-Mods {
    param (
        [string]$mod
    )
    Write-Host "Removing all occurrences of mod: $mod..."

    # Remove any folder or zip file that matches the mod name (including different versions)
    Get-ChildItem -Path $DEST_DIR -Recurse -Filter "$mod*.zip" | Remove-Item -Force
    Get-ChildItem -Path $DEST_DIR -Recurse -Directory -Filter $mod | Remove-Item -Recurse -Force
}

# Function to compress a folder with version number
function Compress-With-Version {
    param (
        [string]$folder
    )

    if (Test-Path $folder) {
        $infoJsonPath = Join-Path $folder "info.json"
        if (Test-Path $infoJsonPath) {
            $version = (Get-Content $infoJsonPath | ConvertFrom-Json).version
            # Remove the "v" from the version
            $zipFile = "${folder}_$version.zip"
            $tempFolder = "${folder}_$version"

            Write-Host "Preparing to compress $folder (version $version) into $zipFile..."

            # Create a temporary copy of the folder with the version number
            Copy-Item -Recurse -Path $folder -Destination $tempFolder

            # Compress the temporary folder
            & 7z a -tzip -xr'!.*' $zipFile $tempFolder
            if ($?) {
                # Remove the temporary folder
                Remove-Item -Recurse -Force $tempFolder

                # Move the zip file to the destination directory
                Write-Host "Moving $zipFile to $DEST_DIR..."
                Move-Item -Path $zipFile -Destination $DEST_DIR
            }
            else {
                Write-Host "Failed to zip $folder"
                exit 1
            }
        }
        else {
            Write-Host "No info.json file found in $folder. Skipping..."
        }
    }
    else {
        Write-Host "$folder does not exist. Skipping..."
    }
}

# Remove all occurrences of the listed mods from the destination folder
foreach ($mod in $MOD_FOLDERS) {
    Remove-Mods -mod $mod
}

# Loop through each mod folder in the array and compress it
foreach ($folder in $MOD_FOLDERS) {
    Compress-With-Version -folder $folder
}

Write-Host "Compression and moving completed."
