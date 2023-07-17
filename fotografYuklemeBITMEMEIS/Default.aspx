<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>..:: Dosya yükleme ::..</title>
    <script type="text/javascript" language="javascript">
        function dosyaSecildiMi() {
            if (document.getElementById("FileUpload1").value == "" ||
             document.getElementById("FileUpload1").value == null) {
                //dosya secilmemis kullanici uyariliyor
                document.getElementById("LabelHata").innerHTML =
                "Lütfen yüklemek istediğiniz dosyayı seçiniz";
                //dosya gonderme islemi iptal edilsin
                return false;
            } else {
                //dosya secilmis, yukleme yapilabilir
            document.getElementById("form1").submit();
            }
        } //dosyaSecildiMi sonu
    </script>
    <style type="text/css">
        a,a:link
        {
            background-color:#ff0080;
            color:White;
            text-align:center;
            display:inline-block;
            width:80px;
            height:25px;  
            text-decoration:none;  
            margin-bottom:3px; 
        }
       a:hover
        {
            background-color:gold;
            color:#333;
            text-align:center;
            display:inline-block;
            width:80px;
            height:25px;  
            text-decoration:none; 
            box-shadow:3px 3px #333;
            margin-bottom:3px; 
            border:2px solid #333;
        }      
    </style>
</head>
<body>
<h1 style="background-color:#ff0080; color:#fff">RESIM YÜKLEME PANELİ</h1>
    <form id="form1" runat="server">

    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Font-Size="Medium" ForeColor="#009933" 
        Text="Yüklemek istediğiniz dosyayı seçiniz"></asp:Label>
    <br />
    <asp:Button ID="ButtonYukle" runat="server" onclick="ButtonYukle_Click" 
        Text="YÜKLE" OnClientClick="return dosyaSecildiMi();"/>
    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#333333" 
        Font-Bold="True" Font-Names="Trebuchet MS" ForeColor="#CC0066" />
&nbsp;
    <br />
    <asp:Label ID="LabelHata" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" Font-Size="Medium" ForeColor="#FF0066"></asp:Label>

    <br />
    <hr />
    
    <asp:Label ID="LabelDetay" runat="server" Font-Bold="True" 
        Font-Names="Trebuchet MS" ForeColor="#0066FF"></asp:Label>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/fotoGaleri.aspx">Galeriye git</asp:HyperLink>
    <hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="AccessDataSource1" AllowPaging="True" 
        PageSize="4">
        <Columns>
            <asp:CommandField CancelText="İptal" DeleteText="Sil" EditText="Düzenle" 
                InsertText="Ekle" NewText="Yeni" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="dosyAdi" HeaderText="dosyAdi" 
                SortExpression="dosyAdi" />
            <asp:BoundField DataField="kucukHTM" HeaderText="kucukHTM" 
                SortExpression="kucukHTM" Visible="False" />
            <asp:BoundField DataField="buyukHTM" HeaderText="buyukHTM" 
                SortExpression="buyukHTM" Visible="False" />
            <asp:BoundField DataField="kucukASP" HeaderText="kucukASP" 
                SortExpression="kucukASP" Visible="False" />
            <asp:BoundField DataField="buyukASP" HeaderText="buyukASP" 
                SortExpression="buyukASP" Visible="False" />
            <asp:ImageField DataImageUrlField="kucukASP" DataImageUrlFormatString="{0}" 
                HeaderText="Küçük resim">
            </asp:ImageField>
            <asp:CheckBoxField DataField="durum" HeaderText="durum" 
                SortExpression="durum" />
        </Columns>
        <PagerStyle Width="40px" />
    </asp:GridView>
    <br />
    <asp:Label ID="LabelDosyadi" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="LabelkucukASP" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="LabelkucukHTM" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="LabelBuyukASP" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="LabelBuyukHTM" runat="server" Visible="False"></asp:Label>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/data.mdb" DeleteCommand="DELETE FROM [tblResimler] WHERE [id] = ?" 
        InsertCommand="INSERT INTO [tblResimler] ([dosyAdi], [kucukHTM], [buyukHTM], [kucukASP], [buyukASP]) VALUES (?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [tblResimler] ORDER BY [id] DESC" 
        UpdateCommand="UPDATE [tblResimler] SET  WHERE [id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="LabelDosyadi" Name="dosyAdi" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelkucukHTM" Name="kucukHTM" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelBuyukHTM" Name="buyukHTM" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelkucukASP" Name="kucukASP" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelBuyukASP" Name="buyukASP" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="durum" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    </form>
</body>
</html>
