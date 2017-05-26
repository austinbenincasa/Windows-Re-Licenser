@echo off
 SetLocal EnableDelayedExpansion
 set count=0
 for /F "delims=" %%a in ('wmic path softwarelicensingservice get OA3xOriginalProductKey') do (
   set Zone=%%a
   set /a count=!count! + 1
   if !count! GTR 1 goto Exit
 )
 :Exit
 echo %Zone%
 
 slmgr.vbs /upk
 slmgr.vbs /ipk %Zone%
 
