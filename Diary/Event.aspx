﻿<%@ Page Title="活動加入" Language="C#" AutoEventWireup="true" trace='false'
Debug="true" MaintainScrollPositionOnPostback="true" Inherits="Diary_Event"
CodeFile="Event.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head id="Head1" runat="server">
    <style type="text/css">
      .style1 {
        text-align: center;
      }
      .timebox{
        border-radius: 10px;
        padding-left: 8px;
        height: 24px;
      }
    </style>
  </head>
  <body runat="server" id="pMaster">
    <link rel="stylesheet" type="text/css" href="./assets/jquery.datetimepicker.min.css"/>

    <form id="form1" runat="server">
        
        <div id="divBody" align="center" style="width: 100%; overflow: auto">
        <asp:Label
        ID="lblTour"
        ForeColor="Green"
        Font-Size="X-Large"
        runat="server"
        />

        <div style="margin: 20px 0 20px 0 ;">
          <asp:Label ID="action" runat="server" />
        </div>
        

        <div style="margin-top: 20px;">
            <label>活動開始:</label>
            <asp:Textbox runat="server" class="timebox" type="text" name="filter-date" id="sdate"/>
        </div>

        <div style="margin-top: 20px;">
            <label>活動結束:</label>
            <asp:Textbox runat="server" class="timebox" type="text" name="filter-date" id="edate"/>
        </div>

        <div style="margin-top: 20px;display: flex;align-items: flex-start;justify-content: center;" >
          <label>活動內容:</label>
          <asp:Textbox runat="server" style="width: 350px;height: 200px;" class="timebox" type="text" name="filter-date"
           id="eventbox"  
          TextMode="MultiLine"/>
      </div>

        <div style="margin-top: 20px;">
            <asp:button runat="server" id="Btn_save" text="存檔" onClick="Btnsave_click"/>
            <asp:button runat="server" id="Btn_exit" text="刪除" OnClientClick="return confirm('確定要刪除這筆活動嗎')" onclick="BtnDel_Click" />
        </div>


    </div>
    </form>

    <script src="./assets/jquery.js"></script>
    <script src="./assets/jquery.datetimepicker.full.min.js"></script>

    <script>
        /*jslint browser:true*/
        /*global jQuery, document*/

        jQuery(document).ready(function () {
            'use strict';

            jQuery('#filter-date, #search-from-date, #search-to-date, #sdate, #edate').datetimepicker();
        });
    </script>
  </body>
</html>
