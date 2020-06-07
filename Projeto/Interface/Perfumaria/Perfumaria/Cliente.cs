using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Perfumaria
{


    public partial class Cliente : Form
    {
        private SqlConnection cn;
        private Client C = new Client();
        public Cliente()
        {
            InitializeComponent();
            tabControl1.SelectedIndexChanged += new EventHandler(tabControl1_SelectedIndexChanged);
            tabControl2.SelectedIndexChanged += new EventHandler(tabControl2_SelectedIndexChanged);
        }

    



    private void Cliente_Load(object sender, EventArgs e)
        {

            cn = getSGBDConnection();
            if (verifySGBDConnection())
            {
                Console.WriteLine("Conexão");
            }
            else
            {
                Console.WriteLine("NOP");
            }

            cn.Close();

            loadInfo(Program.ClientMail);

            showMainInfo();


        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source= HUGOPAIVA450A;integrated security=true;initial catalog=Perfumaria");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void showMainInfo()
        {
            emailbox.Text = C.Email;
            namebox.Text = C.Fname;
            lnamebox.Text = C.Lname;
            if (C.Newsletter)
                newsletter.Checked = true;
            else
                newsletter.Checked = false;
            pontosbox.Text = C.Pontos.ToString();
            selectPayment();
            pictureBox1.Image = Image.FromFile(C.Foto);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;

        }

        public void selectPayment()
        {

            switch (C.Pagamento)
            {
                case "Paypal":
                    pagamentobox.SelectedIndex = 0;
                    break;
                case "MasterCard":
                    pagamentobox.SelectedIndex = 1;
                    break;
                case "Visa":
                    pagamentobox.SelectedIndex = 2;
                    break;
                case "MB Way":
                    pagamentobox.SelectedIndex = 3;
                    break;
                default:
                    pagamentobox.ResetText();
                    pagamentobox.SelectedIndex = -1;
                    break;
            }

        }

        private void loadInfo(String mail)
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.getClientInfo ('" + mail + "')", cn);
            SqlDataReader reader = cmd.ExecuteReader();

            reader.Read();

            C.Email = reader["email"].ToString();
            C.Contribuinte = reader["contribuinte"].ToString();
            C.Fname = reader["fname"].ToString();
            C.Lname = reader["lname"].ToString();
            C.Sexo = (bool)reader["sexo"];
            C.DataNasc = reader["dataNasc"].ToString();
            if (!DBNull.Value.Equals(reader["contacto_default_id"]))
                C.ContactoDefault = (int)reader["contacto_default_id"];
            C.Pontos = (int)reader["pontos"];
            C.Newsletter = (bool)reader["newsletter"];
            C.Pagamento = reader["pagamento"].ToString();
            C.Foto = reader["foto"].ToString();

            cn.Close();

        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            changepw.Visible = true;
        }

        private void cancel_Click(object sender, EventArgs e)
        {
            changepw.Visible = false;
        }

        private void change_Click(object sender, EventArgs e)
        {
            changepw.Visible = false;
        }

        private void tabControl1_SelectedIndexChanged(Object sender, EventArgs e)
        {

            MessageBox.Show("You are in the TabControl.SelectedIndexChanged event.");
        }

        private void tabControl2_SelectedIndexChanged(Object sender, EventArgs e)
        {

            MessageBox.Show("You are in the TabControl.SelectedIndexChanged event.");
        }
    }
}
