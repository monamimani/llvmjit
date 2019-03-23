$libFileList = @(Get-Childitem -Path ".//install" -Recurse -file -filter "*.lib")
$pdbFileList = $libFileList | foreach {
  [io.path]::ChangeExtension($_.name, "pdb")
} 
Write-Host $pdbFileList

$filePathList = $pdbFileList | foreach {
  Get-ChildItem -Path ".//build" -Filter $_ -Recurse | % {$_.FullName}
}
Write-Host $filePathList

Copy-Item -Path $filePathList -Destination ".//install/lib"