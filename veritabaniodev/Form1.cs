using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace veritabaniodev
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        NpgsqlConnection baglantı = new NpgsqlConnection("server=localHost; port=5432; Database=vytsodev; user Id=postgres; password=12345");


        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void btnListele_Click(object sender, EventArgs e)
        {
            string listeleme = "select* from randevu";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(listeleme, baglantı);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            baglantı.Open();
            NpgsqlCommand ekleme = new NpgsqlCommand("insert into randevu(randevuid,doktorid,memnuniyetdurumid,hastaid,durumid,polikinlikid,randevutarihi,odenentutar,odemesekli)  values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9)", baglantı);

            ekleme.Parameters.AddWithValue("@p1", int.Parse(txtrandevu.Text));
            ekleme.Parameters.AddWithValue("@p2", int.Parse(comboBox1.SelectedValue.ToString()));
            ekleme.Parameters.AddWithValue("@p3", int.Parse(comboBox2.SelectedValue.ToString()));
            ekleme.Parameters.AddWithValue("@p4", int.Parse(comboBox3.SelectedValue.ToString()));
            ekleme.Parameters.AddWithValue("@p5", int.Parse(comboBox4.SelectedValue.ToString()));
            ekleme.Parameters.AddWithValue("@p6", int.Parse(comboBox5.SelectedValue.ToString()));

            ekleme.Parameters.AddWithValue("@p7", txtrandevutarih.Text);
            ekleme.Parameters.AddWithValue("@p8", int.Parse(txtodeme.Text));
            ekleme.Parameters.AddWithValue("@p9", txtodemesekli.Text);


            ekleme.ExecuteNonQuery();
            baglantı.Close();
            MessageBox.Show("urun ekleme işlemi başarılı bir şekilde gerçekleştir");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            baglantı.Open();
            NpgsqlDataAdapter d1 = new NpgsqlDataAdapter("select * from doktor", baglantı);
            DataTable dt = new DataTable();
            d1.Fill(dt);
            comboBox1.DisplayMember = "personelad";
            comboBox1.ValueMember = "personelid";
            comboBox1.DataSource = dt;
            baglantı.Close();


            baglantı.Open();
            NpgsqlDataAdapter d2 = new NpgsqlDataAdapter("select * from memnuniyetdurum", baglantı);
            DataTable ds = new DataTable();
            d2.Fill(ds);
            comboBox2.DisplayMember = "memnuniyetAd";
            comboBox2.ValueMember = "memnuniyetid";
            comboBox2.DataSource = ds;
            baglantı.Close();


            baglantı.Open();
            NpgsqlDataAdapter d3 = new NpgsqlDataAdapter("select * from hasta", baglantı);
            DataTable dm = new DataTable();
            d3.Fill(dm);
            comboBox3.DisplayMember = "hastaAd";
            comboBox3.ValueMember = "hastaid";
            comboBox3.DataSource = dm;
            baglantı.Close();


            baglantı.Open();
            NpgsqlDataAdapter d4 = new NpgsqlDataAdapter("select * from randevudurum", baglantı);
            DataTable dd = new DataTable();
            d4.Fill(dd);
            comboBox4.DisplayMember = "durumAd";
            comboBox4.ValueMember = "ranedevuDurumid";
            comboBox4.DataSource = dd;
            baglantı.Close();


            baglantı.Open();
            NpgsqlDataAdapter d5 = new NpgsqlDataAdapter("select * from polikinlik", baglantı);
            DataTable da = new DataTable();
            d5.Fill(da);
            comboBox5.DisplayMember = "polikinlikAd";
            comboBox5.ValueMember = "polikinlikid";
            comboBox5.DataSource = da;
            baglantı.Close();

        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            baglantı.Open();
            NpgsqlCommand silme = new NpgsqlCommand("Delete from randevu Where randevuid =@p1", baglantı);
            silme.Parameters.AddWithValue("@p1", int.Parse(txtrandevu.Text));
            silme.ExecuteNonQuery();
            baglantı.Close();
            MessageBox.Show("Silme İslemi Basariyla Tamamlandı", "Bilgi", MessageBoxButtons.YesNo, MessageBoxIcon.Stop);
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            baglantı.Open();
            NpgsqlCommand guncelle = new NpgsqlCommand("Update randevu set doktorid=@p2,memnuniyetdurumid=@p3,hastaid=@p4,durumid=@p5,polikinlikid=@p6, randevutarihi=@p7, odenentutar=@p8,odemesekli=@p9 where randevuid=@p1", baglantı);
            guncelle.Parameters.AddWithValue("@p2", int.Parse(comboBox1.SelectedValue.ToString()));
            guncelle.Parameters.AddWithValue("@p1", int.Parse(txtrandevu.Text));
            guncelle.Parameters.AddWithValue("@p3", int.Parse(comboBox2.SelectedValue.ToString()));
            guncelle.Parameters.AddWithValue("@p4", int.Parse(comboBox3.SelectedValue.ToString()));
            guncelle.Parameters.AddWithValue("@p5", int.Parse(comboBox4.SelectedValue.ToString()));
            guncelle.Parameters.AddWithValue("@p6", int.Parse(comboBox5.SelectedValue.ToString()));

            guncelle.Parameters.AddWithValue("@p7", txtrandevutarih.Text);
            guncelle.Parameters.AddWithValue("@p8", int.Parse(txtodeme.Text));
            guncelle.Parameters.AddWithValue("@p9", txtodemesekli.Text);

            guncelle.ExecuteNonQuery();
            baglantı.Close();
            MessageBox.Show("Guncelleme islemi tamamlandı", "Bilgi", MessageBoxButtons.YesNo, MessageBoxIcon.Stop);
        }
    }
}
