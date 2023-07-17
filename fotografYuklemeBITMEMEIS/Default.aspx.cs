using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonYukle_Click(object sender, EventArgs e)
    {
        HttpPostedFile pf;
        try
        {
            //dosya orjinal adi ile upload klasorune kaydediliyor
            pf = FileUpload1.PostedFile;
            LabelDosyadi.Text = pf.FileName;
            LabelkucukASP.Text = "~/resimler/kucuk/" + pf.FileName;
            LabelBuyukASP.Text = "~/resimler/buyuk/" + pf.FileName;
            LabelkucukHTM.Text = "resimler/kucuk/" + pf.FileName;
            LabelBuyukHTM.Text = "resimler/buyuk/" + pf.FileName;

            LabelDetay.Text = "Dosya adı:" + pf.FileName +"<br />";
            LabelDetay.Text += "Dosya türü:" + pf.ContentType.ToString() +"<br />";
            LabelDetay.Text += "Dosya boyutu (byte):" + pf.ContentLength.ToString() + "<br />";
            //dosya sunucuya yukleniyor
            pf.SaveAs(Server.MapPath("~/resimler/buyuk/") + FileUpload1.FileName);
            //FileUpload1.SaveAs(Server.MapPath("~/upload/") + FileUpload1.FileName);

            //yuklenen dosya veritabanına kaydediliyor
            try
            {
                AccessDataSource1.Insert();
            }catch(Exception ex){
                LabelHata.Text = "Upps! Hata oluştu<br />";
                LabelHata.Text += "Veritabanına kayıt yapılamadı<br />";
                LabelHata.Text += ex.Message.ToString();           
            }
            LabelHata.Text = "<span style='color:green'>";
            LabelHata.Text += "Dosya yükleme işlemi başarı ile tamamlandı";
            LabelHata.Text += "</span>";
        }catch(Exception ex){
            LabelHata.Text = "Uuuups! Hata olustu <br />";
            LabelHata.Text += ex.Message.ToString() + "<br />";
            LabelHata.Text += "Dosya yüklenemedi";
        }//catch
    }//ButtonYukle_Click sonu
}//class sonu