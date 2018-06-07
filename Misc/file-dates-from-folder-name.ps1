# Set child files modified and created dates to date based on the first 10 chars
# of the parent folders name (which in this use case is formatted as a date yyyy-mm-dd)

foreach ($file in Get-ChildItem) {
  if ($file.Attributes -eq "Directory") {
    
    $date = $file.Name.Substring(0, 10)
    # Write-Output $date
    $subfiles = Get-ChildItem $file.FullName
    foreach ($subfile in $subfiles) {
      $existingDate = [datetime]$subfile.LastWriteTime
      $newDate = [datetime] ($date + " " + $existingDate.TimeOfDay)
      
      $subfile.CreationTime = $newDate
      $subfile.LastWriteTime = $newDate
    }
  }
}