@echo off
mode con: cols=84 lines=30
:ZEROES
cls
title WannaCry����������⡢��ɱ�밲ȫ�ӹ̹���  
color 0A
echo.
echo.
echo ----------------  WannaCry����������⡢��ɱ�밲ȫ�ӹ̹���  ---------------------
echo.
echo.
echo    * WannaCry���������ɼ���Ӳ���ļ����ܺ��߱���֧���߶������п��ܽ��ָܻ�����
echo      ȫ���ոߣ�Ӱ�췶Χ�㣡
echo.
echo    * ������棺����߽����ǽ���445�˿ڵķ��ʣ���ͨ��IPS������ǽ����ذ�ȫ�豸��
echo      �������ϲ��ԡ�    
echo.
echo    * �ն˲��棺��ʱ�ر�Server����,ʹ������"netstat -ano | findstr ":445""��ȷ��
echo      �ر�445�˿ڣ�������΢���������MS17-010����,ѡ���Ӧ�İ汾���в�����װ����
echo      �����ص�ַ��https://technet.microsoft.com/zh-cn/library/security/MS17-010��        
echo.
echo    * ������ϵͳ����Ա������У��˹��߿�ѡ���ܽ��ܣ�
echo.
echo       1���������
echo.
echo       2��������ɱ
echo.
echo       3����ȫ�ӹ�
echo.
echo       4���˳�
echo                                                       By acgbfull                      
echo                                                  https://github.com/acgbfull/ 
echo                                                            
echo ---------------------------------------------------------------------------------
echo.
set num="menu"
set /p num="����������ִ�еĹ���(1 2 3 4 5 6)�󰴻س���:"
if "%num%"=="1" goto virus_check
if "%num%"=="2" goto virus_kill
if "%num%"=="3" goto security_reinforcement
if "%num%"=="4" goto quit
goto ZEROES

:virus_check
cls
color 0C
title 1. �������
rem 1. �������
netstat -ano | findstr /i "SYN_SENT"
echo ---------------------------------------------------------------------------------
c:
cd c:/
dir /od /s /a /b tasks*.exe
dir /od /s /a /b msse*.exe
dir /od /s /a /b qeriuwj*
echo ---------------------------------------------------------------------------------
echo     *  ��ʾtasks*.exe��msse*.exe��qeriuwj*�ļ�, ���Ѹ�Ⱦ����!
echo.
echo     *  ��ʾ����״̬ΪSYN_SENT�ļ�¼, ���Ѹ�Ⱦ����!
echo.
pause
goto ZEROES

:virus_kill
rem 2. ������ɱ
taskkill /F /IM mssecsvc.exe
taskkill /F /IM mssecsvr.exe
taskkill /F /IM tasksche.exe
taskkill /F /IM qeriuwjhrf
attrib -s -h c:\Windows\mssecsvc.exe > nul
attrib -s -h c:\Windows\mssecsvr.exe > nul
attrib -s -h c:\Windows\tasksche.exe > nul
attrib -s -h c:\Windows\qeriuwjhrf > nul
del c:\Windows\mssecsvc.exe /F
del c:\Windows\mssecsvr.exe /F
del c:\Windows\tasksche.exe /F
del c:\Windows\qeriuwjhrf /F
echo ---------------------------------------------------------------------------------
echo     *  WannaCry���������Ѳ�ɱ�ɹ�!
echo.
pause
goto ZEROES

:security_reinforcement
rem ��ȫ�ӹ�
cls
echo.
echo.
echo --------------------------------  ��ȫ�ӹ�  -------------------------------------
echo.
echo.
echo       1��WIN7/XP�ӹ� 2��WIN10�ӹ� 3��WIN2003�ӹ� 4��WIN2008/2012�ӹ� 5.WIN2016�ӹ�
echo.      
echo       6: �����ϼ��˵�
echo.
echo       7: �˳�
echo.
echo ---------------------------------------------------------------------------------
set num2="menu1"
set /p num2="����������ִ�еĹ���(1 2 3 4 5 6)�󰴻س���:"
if "%num2%"=="1" goto create_file
if "%num2%"=="2" goto create_file
if "%num2%"=="3" goto create_file
if "%num2%"=="4" goto create_file
if "%num2%"=="5" goto create_file
if "%num2%"=="6" goto ZEROES
if "%num2%"=="7" goto quit
goto security_reinforcement

:create_file
rem 3. �ӹ�
rem 3.1 �����ļ�
c:
cd c:\Windows\
attrib -s -h -r c:\Windows\mssecsvc.exe  > nul
attrib -s -h -r c:\Windows\mssecsvr.exe > nul
attrib -s -h -r c:\Windows\tasksche.exe > nul
attrib -s -h -r c:\Windows\qeriuwjhrf > nul
echo �������� > mssecsvc.exe
echo �������� > mssecsvr.exe
echo �������� > tasksche.exe
echo �������� > qeriuwjhrf
attrib +r mssecsvc.exe > nul
attrib +r mssecsvr.exe > nul
attrib +r tasksche.exe > nul
attrib +r qeriuwjhrf > nul

rem 3.2 �رն˿�
if "%num2%"=="1" goto WIN7
if "%num2%"=="2" goto WIN10
if "%num2%"=="3" goto WIN2003
if "%num2%"=="4" goto WIN2012
if "%num2%"=="5" goto WIN2016

:WIN7
net stop server /Y > nul
netsh advfirewall set currentprofile state on > nul
netsh advfirewall firewall add rule name="DenyEquationTCP" dir=in action=block localport=445 remoteip=any protocol=tcp > nul
netsh advfirewall firewall add rule name="DenyEquationUDP" dir=in action=block localport=445 remoteip=any protocol=udp > nul
echo ---------------------------------------------------------------------------------
echo    *  Windows 7 OR XPϵͳ�Ѽӹ̳ɹ���
echo.
pause
goto ZEROES
:WIN10
net stop server /Y > nul
netsh firewall set opmode enable > nul
netsh advfirewall firewall add rule name="DenyEquationTCP" dir=in action=block localport=445 remoteip=any protocol=tcp > nul
netsh advfirewall firewall add rule name="DenyEquationUDP" dir=in action=block localport=445 remoteip=any protocol=udp > nul
echo ---------------------------------------------------------------------------------
echo    *  Windows 10ϵͳ�Ѽӹ̳ɹ���
echo.
pause
goto ZEROES
:WIN2003
net stop server /Y > nul
net start sharedaccess > nul
netsh firewall add portopening protocol = ALL port = 445 name = DenyEquationTCP mode = DISABLE scope = ALL profile = ALL > nul
echo ---------------------------------------------------------------------------------
echo    *  Windows Server 2003ϵͳ�Ѽӹ̳ɹ���
echo.
pause
goto ZEROES
:WIN2012
net stop server /Y > nul
net start MpsSvc > nul
netsh advfirewall firewall add rule name="DenyEquationTCP" dir=in action=block localport=445 remoteip=any protocol=tcp > nul
netsh advfirewall firewall add rule name="DenyEquationUDP" dir=in action=block localport=445 remoteip=any protocol=udp > nul
echo ---------------------------------------------------------------------------------
echo    *  Windows Server 2012 OR 2008ϵͳ�Ѽӹ̳ɹ���
echo.
pause
goto ZEROES
:WIN2016
net stop server /Y > nul
netsh advfirewall firewall add rule name="DenyEquationTCP" dir=in action=block localport=445 remoteip=any protocol=tcp > nul
netsh advfirewall firewall add rule name="DenyEquationUDP" dir=in action=block localport=445 remoteip=any protocol=udp > nul
echo ---------------------------------------------------------------------------------
echo    *  Windows Server 2016ϵͳ�Ѽӹ̳ɹ���
echo.
pause
goto ZEROES

:verify
rem 4.1 ��֤�Ƿ�ɹ�
netsh advfirewall firewall show rule name=all | findstr /i "denyequation"
netstat -ano | findstr /i "SYN_SENT"

:quit
