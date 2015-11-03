@@ -0,0 +1,22 @@
﻿#Кодировка
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
#ID объекта для клонирования (берется из строки браузера device.htm?id=8586&tabid=1)
$id_of_device_to_clone = "****";
#ID группы (берется из строки браузера group.htm?id=8585&tabid=1)
$id_of_target_group = "***";
#User
$username="****";
#Password
$password="*****";
#Построчный цикл чтения из файла, сам файл utf-8 без bom 1.имя девайса, 2 его ip, разделитель ";"
foreach($i in Get-Content c:\\prtg\\array.txt)
{
$ind=$i.indexof(";")
$indend1=$ind-1
$indend2=$ind+1
$indend3=$i.length
$OFS=""; $new_name = [string]$i[0..$indend1]
$OFS=""; $new_hostname_or_ip = [string]$i[$indend2..$indend3]
#curl надо скачать =)
C:\curl.exe -G -v "http://prtgserver:8080/api/duplicateobject.htm" --data-urlencode "id=$id_of_device_to_clone" --data-urlencode "name=$new_name" --data-urlencode "host=$new_hostname_or_ip" --data-urlencode "targetid=$id_of_target_group" --data-urlencode "username=$username" --data-urlencode "password=$password"
}
\ No newline at end of file
