#!/bin/zsh


WinPaths="$(/mnt/c/Windows/System32/WindowsPowershell/v1.0/powershell.exe -Command "& {echo \$env:path}")"

LinuxPathsArray=()
IFS=';' read -rA WinPathsArray <<< "$WinPaths"
for WinPath in "${WinPathsArray[@]}"; do
	LinuxPathsArray+=( "$(wslpath "$WinPath")" )
done

IFS=":"; LinuxPathsToAppend="${LinuxPathsArray[*]}"

PATH+="$LinuxPathsToAppend"

export PATH
