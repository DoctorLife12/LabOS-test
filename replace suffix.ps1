$folderPath = "C:\Logs"

# Get all files with the .txt extension in the folder
$files = Get-ChildItem -Path $folderPath -Filter "*.txt" -File

# for loop through each file for rename it with the new suffix
foreach ($file in $files) {
    # save the new name in var
    $newName = $file.FullName -replace "\.txt$", ".xml"
    # rename the file with the new name
    Rename-Item -Path $file.FullName -NewName $newName
}