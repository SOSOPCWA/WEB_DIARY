'1. �ȲMdiary�A�䥦��Ʈw�ݤ�ʰ���
'2. �C�����ݽT�{�{���X�O�_�ݽվ�

'********************************************
DbYear="2013"	'�n�M����~(���]�t)�H�e��ơA�l�ܡB���w�B���j���`�B��w�ƬG�����R��
'********************************************

strConn="Driver={SQL SERVER};Server=sos-vm16;Trusted_Connection=True;Database=" 
Dim conn    : Set conn=CreateObject("ADODB.Connection")   : conn.Open strConn & "Diary"
set rs=createobject("ADODB.Recordset")
'------------------------------------------------------------------------------------
rs.open "select tour,DiaryNo,Status from Diary where tour<'" & DbYear & "01011' and Degree<>2 and Degree<>3",conn   '�ư����j�ƬG�P��w����
while not rs.eof
  tour=rs(0) : DiaryNo=rs(1) : Status=rs(2)
  if Status<>1 and Status<>3 then  '�ư��l�ܻP���w  
    conn.execute "delete from Msg     where tour='" & tour & "' and DiaryNo=" & DiaryNo
    conn.execute "delete from Process where tour='" & tour & "' and DiaryNo=" & DiaryNo
  end if
  rs.movenext
wend
rs.close

conn.execute "delete from Diary where tour<'" & DbYear & "01011' and Status<>1 and Status<>3 and Degree<>2 and Degree<>3" '�ư��l�ܡB���w�B���j���`�B��w�ƬG

conn.execute "delete from Sign where tour not in (select distinct tour from Diary)"
conn.execute "delete from Look where LookDate<'" & DbYear & "/01/01'"
conn.execute "delete from WarnLog where WarnDT<'" & DbYear & "/01/01 00:00'"

msgbox "ok!"


