$RegPath1	=  	"HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3"
$Name = "Settings"
$NewValue1 = Get-ItemProperty -Path $RegPath1
$NewValue1.Settings[12] = 1
$NewValue1.Settings[8] = 3
Set-ItemProperty -Path $RegPath1 -Name $Name -Value $NewValue1.Settings
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideIcons"-Value 1
$img = get-clipboard -format image
Start-Sleep -Seconds 1.5
$img.save("C:\Temp\temp.jpg")
Start-Sleep -Seconds 1.5
set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaper -value "c:\temp\temp.jpg"
set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaperStyle -value 22
Start-Sleep -Seconds 1.5
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
Stop-Process -Name "Explorer"
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
Stop-Process -Name "Explorer"
