
# Read parent CSV
$InputFilename = Get-Content 'C:\Users\vishn\Downloads\sales_records.csv'
$OutputFilenamePattern = 'sales_record_'
$LineLimit = 5000
# Initialize
$line = 0
$i = 0
$file = 0
$start = 0

# Loop all text lines
while ($line -le $InputFilename.Length) {
# Generate child CSVs
if ($i -eq $LineLimit -Or $line -eq $InputFilename.Length) {
$file++
$Filename = "$OutputFilenamePattern$file.csv"
$InputFilename[$start..($line - 1)] | Out-File $Filename -Force
$start = $line;
$i = 0
Write-Host "$Filename"
}
# Increment counters
$i++;
$line++

}