on error resume next		'��L�@��,���i�X��,�H�Khung��
'--------------------------------����]�w------------------------------------------------------------------------------------------------------
'strConn="Driver={SQL SERVER};Server=10.6.1.4;Trusted_Connection=True;Database=" 
strConn="Driver={ODBC Driver 17 for SQL Server};Server=(local);Trusted_Connection=yes;DataTypeCompatibility=80;Database="
Dim conn    : Set conn=CreateObject("ADODB.Connection")   : conn.Open strConn & "Diary"
set rs=createobject("ADODB.Recordset")
set rs1=createobject("ADODB.Recordset")

dim MailTag  : MailTag="#{mail}:" : dim MailOkTag : MailOkTag="#{mail ok!}:"	'mail���ҡG�j�ѳq���@��
dim SqlMail  : SqlMail="SaveDT >='" & DT(now-7,"yyyy/mm/dd 00:00") & "'"	    'Mail & Trace Check 7�ѡA�_�h��ƶq�Ӥj
dim LeafTag  : LeafTag="#{�w��¾}�G"						                    '��¾�Y���γq��
dim TraceTag : TraceTag="#{Trace}:"  					                    	'�l�ܼ��ҡG�C�g�@�q��
dim NewTag   : NewTag="#{New}:"       					                    	'��s���ҡG��s�j��
dim w : w=Weekday(now,vbMonDay)							                        '�{�b�P���X
dim PreDay : PreDay=DT(now-1,"yyyy/mm/dd hh:mi")

'----------------Logging ...... ----------------------------------------------------------------------------------------------------------------
set fs=createobject("scripting.filesystemobject")
if DT(now,"dd")="01" then
  set ff=fs.OpenTextFile("TraceMail_" & DT(now,"mm") & ".log",2,true) 
else
  set ff=fs.OpenTextFile("TraceMail_" & DT(now,"mm") & ".log",8,true)
end if
ff.write DT(now,"yyyy/mm/dd hh:mi:ss")

'-----------------------------�̩m�W������ݤ�x��mail�X�h--------------------------------------------------------------------------------------
rs1.open "select [����],[�Ƶ�] from [View_��´�[�c] where [�ʽ�]='���u' and [�Ƶ�] like '%" & MailTag & "%' and [�Ƶ�] not like '%" & LeafTag & "%'",conn
while not rs1.eof 
  whoProText="" : tour=""	'���o�ӭ��ݳq������x���e

  rs.open "select distinct Diary.tour,Diary.DiaryNo from Diary,Process where Diary.tour=Process.tour and Diary.DiaryNo=Process.DiaryNo" _
    & " and (" & GetGroupSQL(rs1(0)) & ") order by Diary.tour,Diary.DiaryNo",conn
  while not rs.eof
    if rs(0)<>tour then
      tour=rs(0)
      whoProText=whoProText  & vbcrlf & vbcrlf & "[" & tour & "]"  & vbcrlf
    end if

    whoProText=whoProText & GetMsg(tour,rs(1)) & GetDiary(tour,rs(1)) & vbcrlf
    rs.movenext
  wend
  rs.close

  if whoProText<>"" then call SendMail(rs1(0),GetMail(rs1(0),rs1(1)),whoProText)	'mail�X�h

  rs1.movenext
wend
rs1.close
ff.write " [Mail]�G" & DT(now,"hh:mi:ss")

'----------------�ק� MailTag -> MailOkTag----------------------------------------------------------------------------------------------------
rs.open "select ProText from Process where ProText like '%" & MailTag & "%' and " & SqlMail,conn,3,3
while not rs.eof
  rs(0)=replace(rs("ProText"),MailTag,MailOkTag)	'�ȳq���@��
  rs.update
  rs.movenext
wend
rs.close

'----------------���`�B�z���ʰO��--------------------------------------------------------------------------------------------------------------
LifeNo=1
rs.open "select max([�O���s��]) from [���ʰO��]",conn
if not rs.eof then LifeNo=rs(0)+1
rs.close

rs.open "select * from [���ʰO��] where [���W��]='���`�B�z' and ([���ʰO��] like '�R���G�쥻�G%' or [���ʰO��] like '�s�W�G%') and substring([�D��s��],1,7) not in (select distinct [�T���N�X] from [View_SOP])",conn
while not rs.eof
  if GetValue("select [���ʰO��] from [���ʰO��] where [���ʰO��] ='�R���G" & replace(rs(3),"'","''") & "'")="" then
    conn.execute "Insert into [���ʰO��] values(" & LifeNo & ",'���`�B�z','" & rs(2) & "','�R���G" & replace(rs(3),"'","''") & "','����OP','" & DT(now,"yyyy/mm/dd 00:00") & "','0.0.0.0')"
    LifeNo=LifeNo+1
  end if
  rs.movenext
wend
rs.close

rs.open "select * from [View_SOP] where [�T���N�X] in (select substring([�D��s��],1,7) from [���ʰO��] where [���W��]='���`�B�z') and [��s��]='" & year(now-1) & "/" & month(now-1) & "/" & day(now-1) & "'",conn
while not rs.eof
  conn.execute "Insert into [���ʰO��] values(" & LifeNo & ",'���`�B�z','" & rs(0) & "." & rs(1) & "','�ק�G" & replace(rs(2),"'","''") & "','����OP','" & DT(now,"yyyy/mm/dd 00:00") & "','0.0.0.0')"
  LifeNo=LifeNo+1
  rs.movenext
wend
rs.close

rs.open "select * from [View_SOP] where [�T���N�X] not in (select substring([�D��s��],1,7) from [���ʰO��] where [���W��]='���`�B�z')",conn
while not rs.eof
  conn.execute "Insert into [���ʰO��] values(" & LifeNo & ",'���`�B�z','" & rs(0) & "." & rs(1) & "','�s�W�G" & replace(rs(2),"'","''") & "','����OP','" & DT(now,"yyyy/mm/dd 00:00") & "','0.0.0.0')"
  LifeNo=LifeNo+1
  rs.movenext
wend
rs.close

'----------------����--------------------------------------------------------------------------------------------------------------------------
ff.write " [End]�G" & DT(now,"hh:mi:ss") & vbcrlf
ff.close
'msgbox "ok"
'----------------���omail address--------------------------------------------------------------------------------------------------------------
Function GetMail(who,Memo)	
  dim pos : GetMail=""

  pos=instr(1,Memo,MailTag)	
  if pos>0 then GetMail=mid(Memo,pos+8,instr(pos+8,Memo,"#")-pos-8)      
End Function
'----------------��x--------------------------------------------------------------------------------------------------------------
Function GetGroupSQL(who)   'mail���ҡG�j�ѳq���A�l�ܼ��ҡG�C�g�@�q��
  if who="����OP" then
    GetGroupSQL="ProText like '%" & MailTag & "%' and Process." & SqlMail _
        & " or " & w & "=1 and (Status=1 or Status=3) and ProText like '%" & TraceTag & "%'" _
        & " or Process.SaveDT >='" & PreDay & "' and ProText like '%" & NewTag & "%'"  '(1) for operator
  else
    dim rs : set rs=createobject("ADODB.Recordset")
    GetGroupSQL="ProText like '%" & MailTag & who & "%' and Process." & SqlMail _
        & " or " & w & "=1 and (Status=1 or Status=3) and ProText like '%" & TraceTag & who & "%'" _
        & " or Process.SaveDT >='" & PreDay & "' and ProText like '%" & NewTag & who & "%'"  '(1) for ���u

    rs.open "select [�ҧO] from [View_��´�[�c] where [�ʽ�]='���u' and [����]='" & who & "'",conn
    while not rs.eof
      GetGroupSQL=GetGroupSQL & " or ProText like '%" & MailTag & rs(0) & "%' and Process." & SqlMail _
        & " or " & w & "=1 and (Status=1 or Status=3) and ProText like '%" & TraceTag & rs(0) & "%'" _
        & " or Process.SaveDT >='" & PreDay & "' and ProText like '%" & NewTag & rs(0) & "%'"  '(1) for �ҧO
      rs.movenext
    wend
    rs.close

    rs.open "select [�s��] from [View_���@�s��] where [����]='" & who & "'",conn
    while not rs.eof
      GetGroupSQL=GetGroupSQL & " or ProText like '%" & MailTag & rs(0) & "%' and Process." & SqlMail _
        & " or " & w & "=1 and (Status=1 or Status=3) and ProText like '%" & TraceTag & rs(0) & "%'" _
        & " or Process.SaveDT >='" & PreDay & "' and ProText like '%" & NewTag & rs(0) & "%'"  '(1) for �s��
      rs.movenext
    wend
    rs.close
  end if
End Function
'----------------��x--------------------------------------------------------------------------------------------------------------
Function GetMsg(tour,DiaryNo)
  dim rs : set rs=createobject("ADODB.Recordset")
  dim i : i=1 : GetMsg=""
  rs.open "select * from Msg where tour='" & tour & "' and DiaryNo=" & DiaryNo & " order by MsgDT",conn
  while not rs.eof
    GetMsg=GetMsg & "# " & mid(rs("MsgDT"),12) & " " & rs("MsgCode") & " "  & rs("MsgText")  & vbcrlf
    i=i+1
    rs.movenext
  wend
  rs.close
End Function

Function GetDiary(tour,DiaryNo)
  dim rs : set rs=createobject("ADODB.Recordset")
  dim i : i=1 : GetDiary=""
  rs.open "select * from Process where tour='" & tour & "' and DiaryNo=" & DiaryNo & " and ProText not like '@@%' order by ProcessDT",conn
  while not rs.eof
    GetDiary=GetDiary & "(" & i & ") " & rs("UserName") & " " & mid(rs("ProcessDT"),6) & " "  & rs("ProText")  & vbcrlf     
    i=i+1
    rs.movenext
  wend
  rs.close
End Function
'----------------Send Mail--------------------------------------------------------------------------------------------------------------
Sub SendMail(who,email,whoProText)	
  'if who<>"����OP" then exit sub '***********�{��test��************
  if email="" then exit sub

  whoProText=who & " ���x�z�n�G" & vbcrlf & vbcrlf _
    & "�H�U�O�A�ҭt�d���t�Ω�Q��o�Ͳ��`�ƥ�A�ȯZ�H���w�n����u�@��x���A�Цۦ�γq���ȯZ�H����Ӥ�x�O��(http://10.6.1.11:8888)���ɥR�����A���¡I" & vbcrlf _
    & "(�����ɸ��|�G�u�@��x -> �t�γ]�w -> �ϥΤ�U)" & vbcrlf & vbcrlf _
    & whoProText

  sch = "http://schemas.microsoft.com/cdo/configuration/" 
  Set cdoConfig=CreateObject("CDO.Configuration") 
  With cdoConfig.Fields 
	.Item(sch & "sendusing") = 2 ' cdoSendUsingPort 
	.Item(sch & "smtpserverport") = 25
	.Item(sch & "smtpconnectiontimeout") = 60
	.Item(sch & "smtpserver") = "ms1.cwb.gov.tw"  'your smtp
	.update 
  End With
 
  Set cdoMessage=CreateObject("CDO.Message") 
  With cdoMessage 
	.Configuration = cdoConfig 
	.From     ="sosop@cwb.gov.tw"
	.To       =email
	.Subject  ="���Фu�@��x�����`�ƥ�O������ʳq��(" & DT(now,"mm/dd") & ")"
	'.HtmlBody =whoProText
	.TextBody =whoProText
	.BodyPart.charset = "UTF-8" 
	.Send
  End With 

  Set cdoConfig  =nothing
  Set cdoMessage =nothing

  ff.write " " & who
End Sub
'----------------------------------------------------------------------------------------------------------------------------------------
Function GetValue(byval SQL)
  dim dr : set dr=createobject("ADODB.Recordset")
  dr.open SQL,conn

  GetValue=""
  if not dr.eof then GetValue=dr(0)

  dr.close
End Function
'--------------------------------�ɶ��榡���---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Function DT(byval sDT,byval fDT)
  dim YY0,MM0,DD0,HH0,MI0,SS0
  DT=lcase(fDT)
  YY0=year(sDT)   : if instr(1,DT,"yy",1)>0 and instr(1,DT,"yyyy",1)=0 then YY0=mid(YY0,3)
  DT=replace(replace(DT,"yyyy","yy"),"yy",YY0)
  MM0=month(sDT)  : if MM0<10 then MM0="0" & MM0
  DT=replace(DT,"mm",MM0)
  DD0=day(sDT)    : if DD0<10 then DD0="0" & DD0
  DT=replace(DT,"dd",DD0)
  HH0=hour(sDT)   : if HH0<10 then HH0="0" & HH0
  DT=replace(DT,"hh",HH0)
  MI0=minute(sDT) : if MI0<10 then MI0="0" & MI0
  DT=replace(DT,"mi",MI0)
  SS0=second(sDT) : if SS0<10 then SS0="0" & SS0
  DT=replace(DT,"ss",SS0) 
End Function

