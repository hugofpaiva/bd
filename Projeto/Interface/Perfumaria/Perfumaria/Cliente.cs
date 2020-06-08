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
        private Compra Compra = new Compra();
        private Contacto Contacto = new Contacto();
        public Cliente()
        {
            InitializeComponent();
            tabControl1.SelectedIndexChanged += new EventHandler(tabControl1_SelectedIndexChanged);
            tabControl2.SelectedIndexChanged += new EventHandler(tabControl2_SelectedIndexChanged);
            historico.SelectedIndexChanged += new EventHandler(historico_SelectedIndexChanged);
            marcacoes.SelectedIndexChanged += new EventHandler(marcacoes_SelectedIndexChanged);
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
            pictureBox1.Load(C.Foto);
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

        // TAB PRINCIPAL
        private void tabControl1_SelectedIndexChanged(Object sender, EventArgs e)
        {

            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    tabControl2_SelectedIndexChanged(tabControl2, null);
                    break;
                case 1:
                    historico_SelectedIndexChanged(historico, null);
                    break;
                case 2:
                    orderdescasc.SelectedIndex = 0;
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                    Favourites.DataSource = getClientFavourites();
                    break;

            }
        }

        //TAB MAIN INFORMÇÕES CLIENTE
        private void tabControl2_SelectedIndexChanged(Object sender, EventArgs e)
        {
            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    showMainInfo();
                    break;
                case 1:
                    
                    break;
            }

            MessageBox.Show("You are in the TabControl.SelectedIndexChanged event.");
        }

        private void historico_SelectedIndexChanged(Object sender, EventArgs e)
        {
            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    buyHistory.DataSource = getClientBuyHistory();
                    break;
                case 1:
                    servicosgrid.DataSource = getClientServicesHistory();
                    break;
            }

            
        }

        private void marcacoes_SelectedIndexChanged(Object sender, EventArgs e)
        {
            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    dateTimePicker1.MinDate = DateTime.Today;
                    break;
                case 1:
                    futureMarcGrid.DataSource = getClientFutureMarc();
                    break;
            }


        }

        private DataTable getClientBuyHistory()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.clientBuyHistory ('" + C.Email + "')", cn);
   
            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(cmd);

            DataTable dtRecord = new DataTable();
            sqlDataAdap.Fill(dtRecord);
            cn.Close();
            return dtRecord;  

        }

        private DataTable getClientServicesHistory()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.clientServicesHistory ('" + C.Email + "')", cn);

            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(cmd);

            DataTable dtRecord = new DataTable();
            sqlDataAdap.Fill(dtRecord);
            cn.Close();
            return dtRecord;

        }

        private DataTable getClientContacts()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.clientServicesHistory ('" + C.Email + "')", cn);

            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(cmd);

            DataTable dtRecord = new DataTable();
            sqlDataAdap.Fill(dtRecord);
            cn.Close();
            return dtRecord;
        }

        private DataTable getClientFutureMarc()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.clientFutureMarc ('" + C.Email + "')", cn);

            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(cmd);

            DataTable dtRecord = new DataTable();
            sqlDataAdap.Fill(dtRecord);
            cn.Close();
            return dtRecord;
        }

        private DataTable getClientFavourites()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.clientFavourites ('" + C.Email + "')", cn);

            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(cmd);

            DataTable dtRecord = new DataTable();
            sqlDataAdap.Fill(dtRecord);
            cn.Close();
            return dtRecord;
        }

        private void buyHistory_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Ignore clicks that are not in our 
            if (e.ColumnIndex == buyHistory.Columns["Detalhes"].Index && e.RowIndex >= 0)
            {
                selectPanel((int)buyHistory.Rows[e.RowIndex].Cells[3].Value);
                
            }

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            
        }

        private void search_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_2(object sender, EventArgs e)
        {

        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void selectPanel(int compra)
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("perf.getDetailsFromBuy", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@numero", compra);
            

            try
            {
                SqlDataReader reader = cmd.ExecuteReader();

                reader.Read();
                

                Compra.Pagamento = reader["pagamento"].ToString();
                Compra.Contribuinte = reader["contribuinte"].ToString();
                Compra.Numero = (int)reader["numero"];
                Compra.Datacompra = reader["datacompra"].ToString();


                if (reader.GetName(2).Equals("fname", StringComparison.InvariantCultureIgnoreCase))
                {
                    Compra.Funcionario = reader["fname"].ToString();
                    compraPresencialDetalhes();
                    
                } else
                {

                Compra.Rating = reader["rating"].ToString();
                Compra.Observacao = reader["observacao"].ToString();
                Compra.Rastreamento = reader["rastreamento"].ToString();
                Compra.Presente = (bool)reader["presente"];
                Contacto.Telemovel = reader["telemovel"].ToString();
                Contacto.Codigopostal = reader["codigo_postal"].ToString();
                Contacto.Endereco = reader["endereco"].ToString();
                Compra.Pontosacumulados = (int)reader["pontosacumulados"];
                Compra.Pontosgastos = (int)reader["pontosgastos"];
                compraOnlineDetalhes();
                }


            }
            catch (Exception ex)
            {
                throw new Exception("Failed to get Compra. \n ERROR MESSAGE: \n" + ex.Message);
            }
           
           

            cn.Close();

        }

        public void compraPresencialDetalhes()
        {
            compraoffline.Visible = true;
            datacompraoff.Text = Compra.Datacompra;
            numcompraoff.Text = Compra.Numero.ToString();
            funcionariocompraoff.Text = Compra.Funcionario;
            contribuintecompraoff.Text = Compra.Contribuinte;
            pagamentocompraoff.Text = Compra.Pagamento;
        }

        public void compraOnlineDetalhes()
        {   
            compraonline.Visible = true;
            datacompraon.Text = Compra.Datacompra;
            numerocompraon.Text = Compra.Numero.ToString();
            if(!String.IsNullOrEmpty(Compra.Rating))
                rating.SelectedIndex = (int)(Int32.Parse(Compra.Rating) - 1);
            telmcompraon.Text = Contacto.Telemovel;
            enderecocompraon.Text = Contacto.Endereco;
            postalcompraon.Text = Contacto.Codigopostal;
            observacaocompraon.Text = Compra.Observacao;
            presentecompraon.Checked = (bool)Compra.Presente;
            rastreamentocompraon.Text = Compra.Rastreamento;
            contribuintecompraon.Text = Compra.Contribuinte;
            pagamentocompraon.Text = Compra.Pagamento;


        }

        private void fecharonline_Click(object sender, EventArgs e)
        {
            compraonline.Visible = false;
        }

        private void fecharoffline_Click(object sender, EventArgs e)
        {
            compraoffline.Visible = false;
        }
    }
}
