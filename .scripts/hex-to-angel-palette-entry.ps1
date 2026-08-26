$hex = Read-Host "Enter hex color"

$hex = $hex.Trim() -replace '^#', ''

if ($hex.Length -eq 6) {
    # RGB
    $r = [Convert]::ToInt32($hex.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($hex.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($hex.Substring(4, 2), 16)

    $output = "{ $($r.ToString('D3')), $($g.ToString('D3')), $($b.ToString('D3')) }"
}
elseif ($hex.Length -eq 8) {
    # RGBA
    $r = [Convert]::ToInt32($hex.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($hex.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($hex.Substring(4, 2), 16)
    $a = [Convert]::ToInt32($hex.Substring(6, 2), 16)

    $alpha = $a / 255.0
    $alphaStr = $alpha.ToString('0.##')

    $output = "{ $($r.ToString('D3')), $($g.ToString('D3')), $($b.ToString('D3')), $alphaStr }"
}
else {
    Write-Warning "Invalid hex length. Expected 6 characters (RGB) or 8 (RGBA)."
    $output = $null
}

if ($output) {
    Write-Output $output
}