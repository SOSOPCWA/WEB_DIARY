<%@ Page Title="�B�z�L�{" Language="C#" MasterPageFile="../MasterPage.master"
AutoEventWireup="true" validateRequest="false" Debug="true"
MaintainScrollPositionOnPostback="true" CodeFile="Process.aspx.cs"
Inherits="Diary_Process" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  runat="Server"
>
  <!----------------���D--------------------------------------------------------------->
  <br />
  <div align="center">
    <table
      style="
        border-bottom: solid 1px gray;
        border-left: solid 1px gray;
        border-right: solid 1px gray;
        border-top: solid 1px gray;
      "
    >
      <tr>
        <td align="center" style="font-size: xx-large; font-family: �з���">
          �B�z�L�{�n���e��
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <!----------------�B�z�ɶ�--------------------------------------------------------------->
      <tr>
        <td align="left" style="font-size: large; font-family: �з���">
          &nbsp;�B�z�ɶ�:&nbsp;
          <asp:DropDownList ID="SelProYYYY" runat="server" ForeColor="Green">
          </asp:DropDownList
          >�~
          <asp:DropDownList ID="SelProMM" runat="server" ForeColor="Green">
          </asp:DropDownList
          >��
          <asp:DropDownList ID="SelProDD" runat="server" ForeColor="Green">
          </asp:DropDownList
          >��&nbsp;&nbsp;
          <asp:DropDownList ID="SelProHH" runat="server" ForeColor="Green">
          </asp:DropDownList
          >��
          <asp:DropDownList ID="SelProMI" runat="server" ForeColor="Green">
          </asp:DropDownList
          >�� &nbsp;&nbsp; �O���H��:
          <asp:DropDownList
            ID="SelOP"
            runat="server"
            ForeColor="Green"
            DataSourceID="SqlDataSourceOP"
            DataValueField="�N��"
            DataTextField="����"
          >
            <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource
            ID="SqlDataSourceOP"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
            SelectCommand=""
          >
          </asp:SqlDataSource
          >&nbsp;&nbsp; �v�d�p��/�t�d�H����:
          <asp:TextBox
            ID="txtRt"
            runat="server"
            Width="10"
            ForeColor="Green"
            CssClass="style0"
          ></asp:TextBox>
          <asp:Button ID="BtnRate" runat="server" Text="��!" />

          <font
            color="blue"
            size="2"
            style="cursor: pointer"
            onclick="alert('����Ф��w���Τ��ιq���s�W�O���ɡA�i���䥦�O���H���I\n\n���s�W�H��A�߰O���H���i�ק�O���C\n\n�D���ФH�����ﶵ�L�@�ΡA�Щ������C');"
          >
            <u>����</u>
          </font>
          <br />
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>

      <!----------------�B�z�L�{--------------------------------------------------------------->
      <tr>
        <td align="left">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="left" style="font-size: large; font-family: �з���">
                &nbsp;�B�z�L�{:
              </td>

              <td align="left" valign="middle">
                <asp:Menu
                  ID="MenuWord"
                  runat="server"
                  BackColor=""
                  DynamicHorizontalOffset="2"
                  StaticEnableDefaultPopOutImage="false"
                  MaximumDynamicDisplayLevels="3"
                  Font-Names="�з���"
                  Font-Size="Small"
                  ForeColor="Black"
                  Orientation="Horizontal"
                  StaticMenuStyle-BorderWidth="0"
                  StaticSubMenuIndent="10px"
                  BorderStyle="Groove"
                  Font-Italic="False"
                  StaticMenuItemStyle-Font-Size="Small"
                  StaticMenuItemStyle-Font-Underline="true"
                  RenderingMode="Table"
                  OnMenuItemClick="MenuWord_MenuItemClick"
                >
                  <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                  <DynamicMenuItemStyle
                    HorizontalPadding="5px"
                    VerticalPadding="2px"
                  />
                  <DynamicMenuStyle BackColor="#E3EAEB" />
                  <DynamicSelectedStyle BackColor="LightGreen" />
                  <StaticMenuItemStyle ForeColor="Green" />
                  <Items>
                    <asp:MenuItem Text="�ɤJ���J"> </asp:MenuItem>
                  </Items>
                  <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                  <StaticMenuItemStyle
                    HorizontalPadding="5px"
                    VerticalPadding="2px"
                  />
                  <StaticSelectedStyle BackColor="#1C5E55" />
                </asp:Menu>
              </td>

              <!----------------�Ӽh/����--------------------------------------------------------------->
              <td
                align="right"
                style="
                  font-family: �з���;
                  font-size: large;
                  padding-left: 20px;
                "
              >
                <!-- �Ӽh/����:
                <asp:DropDownList
                  ID="SelFloorArea"
                  runat="server"
                  ForeColor="Green"
                  DataSourceID="SqlDataSourceFloorArea"
                  DataValueField="Config"
                  DataTextField="Item"
                  AppendDataBoundItems="true"
                >
                  <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource
                  ID="SqlDataSourceFloorArea"
                  runat="server"
                  ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
                  SelectCommand="select [Item],[Config] from [Config] where [Kind]='�Ӽh/����' order by [Mark],[Config]"
                >
                </asp:SqlDataSource
                >&nbsp; -->
                <asp:LinkButton
                  runat="server"
                  tooltip="�п�J������ƥ�ܳB�z���ɶ�"
                  onclientclick="return false"
                  Forecolor="#0000AC"
                  style="text-decoration: none"
                  >�B�z�ɶ�:</asp:LinkButton
                >
                <asp:TextBox
                  ID="txtPM"
                  runat="server"
                  Width="30"
                  ForeColor="Green"
                  CssClass="style0"
                ></asp:TextBox>
                ��
              </td>

              <td align="right" style="font-family: �з���; font-size: large">
                &nbsp;&nbsp;�s�׮ɬq:
                <asp:DropDownList ID="SelCall" runat="server" ForeColor="Green">
                  <asp:ListItem></asp:ListItem>
                  <asp:ListItem Value="����">����</asp:ListItem>
                  <asp:ListItem Value="�W�Z">�W�Z</asp:ListItem>
                  <asp:ListItem Value="�U�Z">�U�Z</asp:ListItem>
                  <asp:ListItem Value="�b�]"
                    >�b�]</asp:ListItem
                  > </asp:DropDownList
                >&nbsp;&nbsp; ���פH��:
                <asp:TextBox
                  ID="txtMt"
                  runat="server"
                  Width="100"
                  ForeColor="Green"
                  CssClass="style0"
                ></asp:TextBox
                >&nbsp;
              </td>

              <td align="left" valign="middle">
                <asp:Menu
                  ID="MenuMt"
                  runat="server"
                  BackColor=""
                  DynamicHorizontalOffset="2"
                  StaticEnableDefaultPopOutImage="false"
                  MaximumDynamicDisplayLevels="3"
                  Font-Names="�з���"
                  Font-Size="Small"
                  ForeColor="Black"
                  Orientation="Horizontal"
                  StaticMenuStyle-BorderWidth="0"
                  StaticSubMenuIndent="10px"
                  BorderStyle="Groove"
                  Font-Italic="False"
                  StaticMenuItemStyle-Font-Size="Small"
                  StaticMenuItemStyle-Font-Underline="true"
                  RenderingMode="Table"
                  OnMenuItemClick="MenuMt_MenuItemClick"
                >
                  <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                  <DynamicMenuItemStyle
                    HorizontalPadding="5px"
                    VerticalPadding="2px"
                  />
                  <DynamicMenuStyle BackColor="#E3EAEB" />
                  <DynamicSelectedStyle BackColor="LightGreen" />
                  <StaticMenuItemStyle ForeColor="Green" />
                  <Items>
                    <asp:MenuItem Text="�ɤJ"> </asp:MenuItem>
                  </Items>
                  <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                  <StaticMenuItemStyle
                    HorizontalPadding="5px"
                    VerticalPadding="2px"
                  />
                  <StaticSelectedStyle BackColor="#1C5E55" />
                </asp:Menu>
              </td>

              <td align="left" style="font-family: �з���">
                &nbsp;&nbsp;
                <font
                  style="
                    color: Blue;
                    text-decoration: underline;
                    font-size: x-small;
                    cursor: pointer;
                    font-size: small;
                  "
                >
                  <u
                    onclick="alert('1.�ݧe�֪��x�Ѻ��פH���[�Z�ӽФ���\n\n2.�C���B�z�L�{�u��O���@����פH���A�Y�s�׼ƤH�A�Ф���O��\n\n3.�s�׮ɬq�G\n���ΡG���Υs�סA���פH���Ъť�\n�W�Z�G�W�Z�ɶ�\n�U�Z�G06:00~23:00�D�W�Z�ɶ�\n�b�]�G23:00~06:00\n\n4.�s�׮ɬq�Y�D���ΡA�h���פH������A�Ϥ���M\n\n5.���פH���Y�B�z�H��');"
                    >����</u
                  >
                </font>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td align="left" style="font-size: large; font-family: �з���">
          &nbsp;<asp:TextBox
            ID="txtProcess"
            name="txtProcess"
            runat="server"
            Columns="112"
            Rows="10"
            TextMode="MultiLine"
            onfocus="this.style.backgroundColor='#FDFFCF'"
            onblur="this.style.backgroundColor='white'"
          ></asp:TextBox
          >&nbsp;
        </td>
      </tr>

      <tr>
        <td align="left" colspan="5">
          <br />&nbsp;�@���ݩʰϡG
          <hr />
        </td>
      </tr>
      <!----------------�@���ݩ�--------------------------------------------------------------->
      <tr>
        <td
          align="left"
          style="font-size: large; font-family: �з���; color: Red"
        >
          &nbsp;�ڦ]�t��:
          <asp:DropDownList
            ID="SelSysCode"
            runat="server"
            ForeColor="Green"
            DataSourceID="SqlDataSourceSysCode"
            DataValueField="Config"
            DataTextField="Item"
            AppendDataBoundItems="true"
            AutoPostBack="true"
            OnSelectedIndexChanged="SelSysCode_SelectedIndexChanged"
          >
            <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource
            ID="SqlDataSourceSysCode"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
            SelectCommand="select [Item],[Config] from [Config] where [Kind]='�t�ΥN�X' order by [Mark],[Config]"
          >
          </asp:SqlDataSource
          >&nbsp;&nbsp; �겣����:
          <asp:DropDownList
            ID="SelKind"
            runat="server"
            ForeColor="Green"
            DataSourceID="SqlDataSourceKind"
            DataValueField="Item"
            DataTextField="Config"
            AppendDataBoundItems="true"
          >
            <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource
            ID="SqlDataSourceKind"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
            SelectCommand="select [Item],[Config] from [Config] where [Kind]='�T������' and [Mark]<>'z' order by [Mark]"
          >
          </asp:SqlDataSource
          >&nbsp;&nbsp; ���`����:
          <asp:DropDownList
            ID="SelDegree"
            runat="server"
            ForeColor="Green"
            DataSourceID="SqlDataSourceDegree"
            DataValueField="Config"
            DataTextField="Item"
            AppendDataBoundItems="true"
          >
            <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource
            ID="SqlDataSourceDegree"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
            SelectCommand="select [Item],[Config] from [Config] where [Kind]='���`����' order by [Config]"
          >
          </asp:SqlDataSource
          >&nbsp;

          <font
            color="blue"
            size="2"
            onclick="alert('�������t�d�H�i��έp���(�U�@��5��)���e�ק�');"
          >
            <u style="cursor: pointer">����</u> </font
          >&nbsp;
          <a href="../help/���`�ƥ󵥯��|�һ���.txt" target="_blank"
            ><font color="blue" size="2">����</font></a
          >&nbsp;
        </td>
      </tr>
      <!----------------�l�ܤ��i--------------------------------------------------------------->
      <tr>
        <td align="left" style="font-size: large; font-family: �з���">
          <br />&nbsp;�B�z���A:
          <asp:DropDownList
            ID="SelStatus"
            runat="server"
            ForeColor="Green"
            DataSourceID="SqlDataSourceStatus"
            DataValueField="Config"
            DataTextField="Memo"
            AutoPostBack="true"
            OnSelectedIndexChanged="SelStatus_SelectedIndexChanged"
          >
            <asp:ListItem></asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource
            ID="SqlDataSourceStatus"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
            SelectCommand="select [Config],[Memo] from [Config] where [Kind]='�B�z���A' order by [Mark]"
          >
          </asp:SqlDataSource
          >&nbsp;&nbsp; ���i����:
          <asp:DropDownList
            ID="SelYYYY"
            runat="server"
            ForeColor="Green"
            AppendDataBoundItems="true"
          >
            <asp:ListItem></asp:ListItem> </asp:DropDownList
          >�~
          <asp:DropDownList
            ID="SelMM"
            runat="server"
            ForeColor="Green"
            AppendDataBoundItems="true"
          >
            <asp:ListItem></asp:ListItem> </asp:DropDownList
          >��
          <asp:DropDownList
            ID="SelDD"
            runat="server"
            ForeColor="Green"
            AppendDataBoundItems="true"
          >
            <asp:ListItem></asp:ListItem> </asp:DropDownList
          >��
          <asp:DropDownList ID="SelClass" runat="server" ForeColor="Green">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="1">��</asp:ListItem>
            <asp:ListItem Value="2">��</asp:ListItem>
            <asp:ListItem Value="3">��</asp:ListItem> </asp:DropDownList
          >�Z

          <font
            color="blue"
            size="2"
            style="cursor: pointer"
            onclick="alert('1. ���]�w�l�ܩΪ��Ѥ��i�A�бN�B�z���A�]�w�� [�C�l��/���Ѥ��i]\n'
                                                         + '2. ���Ѥ��i��ݱN�~�����]�� [�ä[]\n'
                                                         + '3. ���]�w������l�ܤ��i�A����|�������ܡA�H�K�l�ܳB�z\n'
                                                         + '4. ���N�l�ܤ��i���סA�бN�B�z���A�אּ [���i�w����/����]\n'
                                                         + '5. ���Ϫ��Ѥ��i���ġA�бN�B�z���A�אּ [���i�w����/����]\n'
                                                         + '6. �l�ܵ��׮ɡA���i�������w�]�ȬO�{�b��Z�A�Y�令�ä[�A�|�ܦ����Ĥ����Ѥ��i\n'
                                                         + '7. �N�B�z���A�]�� [(���w���A)]�A�|�P����ܩ�l�ܤΪ��Ѥ��i');"
            >&nbsp; <u>����</u> </font
          >&nbsp;
        </td>
      </tr>
      <!----------------�s�@��--------------------------------------------------------------->
      <tr>
        <td align="right" colspan="5">
          <br />
          <asp:Panel
            ID="PanelMove"
            runat="server"
            ForeColor="Green"
            Visible="false"
          >
            <asp:DropDownList
              ID="SelMoveYYYY"
              runat="server"
              ForeColor="Green"
              AutoPostBack="true"
              OnSelectedIndexChanged="MoveTour_Changed"
            >
            </asp:DropDownList
            >�~&nbsp;

            <asp:DropDownList
              ID="SelMoveMM"
              runat="server"
              ForeColor="Green"
              AutoPostBack="true"
              OnSelectedIndexChanged="MoveTour_Changed"
            >
            </asp:DropDownList
            >��&nbsp;

            <asp:DropDownList
              ID="SelMoveDD"
              runat="server"
              ForeColor="Green"
              AutoPostBack="true"
              OnSelectedIndexChanged="MoveTour_Changed"
            >
            </asp:DropDownList
            >��&nbsp;

            <asp:DropDownList
              ID="SelMoveClass"
              runat="server"
              ForeColor="Green"
              AutoPostBack="true"
              OnSelectedIndexChanged="MoveTour_Changed"
            >
              <asp:ListItem Value="1">��</asp:ListItem>
              <asp:ListItem Value="2">��</asp:ListItem>
              <asp:ListItem Value="3">��</asp:ListItem> </asp:DropDownList
            >�Z &nbsp;&nbsp;

            <asp:DropDownList
              ID="SelDiaryNo"
              runat="server"
              ForeColor="Green"
              DataSourceID="SqlDataSourceDiaryNo"
              DataValueField="DiaryNo"
              DataTextField="TextNo"
            >
            </asp:DropDownList>
            <asp:SqlDataSource
              ID="SqlDataSourceDiaryNo"
              runat="server"
              ConnectionString="<%$ ConnectionStrings:DiaryConnectionString %>"
            ></asp:SqlDataSource
            >&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button
              ID="BtnMove"
              runat="server"
              Text="�T�w���J"
              OnClick="BtnMove_Click"
              ToolTip="�Y�Ȧ��@���B�z�L�{�A�h�s�a�R�����x���A�ΰT����T�C"
            />&nbsp;&nbsp;
            <asp:Button
              ID="BtnCancel"
              runat="server"
              Text="����"
              OnClick="BtnCancel_Click"
            />&nbsp;&nbsp;
          </asp:Panel>

          <asp:Panel ID="PanelSave" runat="server">
            <asp:LinkButton
              ID="LinkMove"
              Visible="false"
              runat="server"
              Font-Size="Small"
              ForeColor="Blue"
              OnClick="LinkMove_Click"
              ToolTip="�Y�Ȧ��@���B�z�L�{�A�h�s�a�R�����x���A�ΰT����T�C"
              >�N�B�z�L�{���� ...</asp:LinkButton
            >&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button
              ID="BtnSave"
              runat="server"
              Text="�@�s�@�ɡ@"
              Font-Size="Large"
              OnClick="BtnSave_Click"
            />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button
              ID="BtnExit"
              runat="server"
              Text="�@���@�}�@"
              Font-Size="Large"
              OnClick="BtnExit_Click"
            />&nbsp;&nbsp;
          </asp:Panel>
        </td>
      </tr>
    </table>
  </div>

  <asp:Label ID="lblMsgDT" runat="server" Visible="false" />
  <asp:Label ID="lblMsgText" runat="server" Visible="false" />
</asp:Content>
