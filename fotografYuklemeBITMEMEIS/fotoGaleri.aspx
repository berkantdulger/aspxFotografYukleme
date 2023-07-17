<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fotoGaleri.aspx.cs" Inherits="fotoGaleri" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<h1 style="background-color:#0066ff; color:#fff">FOTOĞRAF GALERİSİ</h1>
    <form id="form1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
        DataSourceID="AccessDataSource1" PageSize="4">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="dosyAdi" HeaderText="DOSYA ADI" 
                SortExpression="dosyAdi" />
            <asp:BoundField DataField="kucukASP" HeaderText="kucukASP" 
                SortExpression="kucukASP" Visible="False" />
            <asp:BoundField DataField="buyukASP" HeaderText="buyukASP" 
                SortExpression="buyukASP" Visible="False" />
            <asp:CheckBoxField DataField="durum" HeaderText="durum" SortExpression="durum" 
                Visible="False" />
            <asp:ImageField DataImageUrlField="kucukASP" DataImageUrlFormatString="{0}" 
                HeaderText="ÖN-İZLE">
            </asp:ImageField>
            <asp:HyperLinkField DataNavigateUrlFields="buyukASP" 
                DataNavigateUrlFormatString="{0}" HeaderText="ORJINAL BOYUT" Text="Göster" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/data.mdb" 
        SelectCommand="SELECT [id], [dosyAdi], [kucukASP], [buyukASP], [durum] FROM [tblResimler] WHERE ([durum] = ?) ORDER BY [id] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="durum" Type="Boolean" />
        </SelectParameters>
    </asp:AccessDataSource>

    </form>
</body>
</html>
