@echo off

set prefix=R.seau

set counter=0
for /f "tokens=*" %%k in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles"') do (
	reg query "%%k" | findstr /R ProfileName.*%prefix%.[0-9]*$ && if errorlevel 0 set /A counter=counter+1 && if errorlevel 0 REM reg delete "%%k" /f
)

echo Found %counter% matching keys
pause
