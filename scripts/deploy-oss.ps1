# Deploy dist/ to Aliyun OSS using tools/ossutil/ossutil64.exe and oss.config
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$configPath = Join-Path $root "oss.config"
$ossutil = Join-Path $root "tools\ossutil\ossutil64.exe"
$dist = Join-Path $root "dist"
$configFile = Join-Path $root "tools\ossutil\ossutil.ini"

if (-not (Test-Path $configPath)) { throw "Missing oss.config" }
if (-not (Test-Path $ossutil)) { throw "Missing tools\ossutil\ossutil64.exe" }
if (-not (Test-Path $dist)) { throw "Missing dist\. Run npm run build first." }

$map = @{}
Get-Content -LiteralPath $configPath -Encoding UTF8 | ForEach-Object {
  $line = $_.Trim()
  if ($line -eq "" -or $line.StartsWith("#")) { return }
  $i = $line.IndexOf("=")
  if ($i -lt 1) { return }
  $k = $line.Substring(0, $i).Trim()
  $v = $line.Substring($i + 1).Trim()
  $map[$k] = $v
}

foreach ($need in @("endpoint", "bucket", "accessKeyId", "accessKeySecret")) {
  if (-not $map.ContainsKey($need) -or [string]::IsNullOrWhiteSpace($map[$need]) -or $map[$need].StartsWith("换成")) {
    throw "oss.config missing valid value for: $need"
  }
}

$endpoint = $map["endpoint"]
$bucket = $map["bucket"]
$id = $map["accessKeyId"]
$secret = $map["accessKeySecret"]

Write-Host "Bucket: $bucket"
Write-Host "Endpoint: $endpoint"
Write-Host "Source: $dist"

& $ossutil config -e $endpoint -i $id -k $secret -L CH --config-file $configFile
if ($LASTEXITCODE -ne 0) { throw "ossutil config failed" }

# ossutil 1.7 uses "sync" (not "mirror")
& $ossutil sync $dist "oss://$bucket/" --config-file $configFile -f -u --delete
if ($LASTEXITCODE -ne 0) {
  throw "ossutil sync failed with exit code $LASTEXITCODE"
}

Write-Host "Upload OK."
