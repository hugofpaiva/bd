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
        List<Contacto> ContactosList = new List<Contacto>();
        List<Produto> ProdutosList = new List<Produto>();
        public Cliente()
        {
            InitializeComponent();
            tabControl1.SelectedIndexChanged += new EventHandler(tabControl1_SelectedIndexChanged);
            tabControl2.SelectedIndexChanged += new EventHandler(tabControl2_SelectedIndexChanged);
            historico.SelectedIndexChanged += new EventHandler(historico_SelectedIndexChanged);
            marcacoes.SelectedIndexChanged += new EventHandler(marcacoes_SelectedIndexChanged);
            onlinetab.SelectedIndexChanged += new EventHandler(onlinetab_SelectedIndexChanged);
            offlinetab.SelectedIndexChanged += new EventHandler(offlinetab_SelectedIndexChanged);
            pesquisa.GotFocus += new EventHandler(RemoveText);
            pesquisa.LostFocus += new EventHandler(AddText);
            cupontextbox.GotFocus += new EventHandler(RemoveText);
            cupontextbox.LostFocus += new EventHandler(AddText);
        }

    



    private void Cliente_Load(object sender, EventArgs e)
        {

            cn = getSGBDConnection();

            if (verifySGBDConnection())
            {
                loadInfo(Program.ClientMail);
                showMainInfo();
            }

            cn.Close();

            


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
                    orderby.SelectedIndex = 0;
                    categoriacombo.SelectedIndex = 0;
                    marcacombo.SelectedIndex = 0;
                    destinatariocombo.SelectedIndex = 0;
                    getProductsProperties();
                    searchProducts();
                    lojagrid.DataSource = ProdutosList.Select(o => new
                    {Nome = o.Nome, Marca = o.Marca, Categoria = o.Categoria, Destinatário = o.Destinatario, Preço = o.Preco }).ToList();
                    break;
                case 3:
                    break;
                case 4:
                    cupoespontos.Text = C.Pontos.ToString();
                    cupoesgrid.DataSource = getClientCupons();
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
                    getClientContacts();
                    contactsgrid.DataSource = ContactosList.Select(o => new
                    { Predefinido = o.Default, Telemóvel = o.Telemovel, CódigoPostal = o.Codigopostal, País = o.Pais, Endereço = o.Endereco, Apartamento = o.Apartamento, Localidade = o.Localidade }).ToList();
                    break;
            }
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

        private void onlinetab_SelectedIndexChanged(Object sender, EventArgs e)
        {
            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    compraOnlineDetalhes();
                    break;
                case 1:
                    compraonlinegrid.DataSource = getCompraProducts();
                    break;
            }


        }

        private void offlinetab_SelectedIndexChanged(Object sender, EventArgs e)
        {
            switch ((sender as TabControl).SelectedIndex)
            {
                case 0:
                    compraPresencialDetalhes();
                    break;
                case 1:
                    compraofflinegrid.DataSource = getCompraProducts();
                    break;
            }


        }


        private void getProductsProperties()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT DISTINCT marca FROM perf.getAllProducts ()", cn);

            SqlDataReader reader = cmd.ExecuteReader();
            marcacombo.Items.Clear();
            marcacombo.Items.Add("Todos");
            while (reader.Read())
            {
                marcacombo.Items.Add(reader["marca"].ToString());
            };

            reader.Close();

            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            cmd = new SqlCommand("SELECT DISTINCT categoria FROM perf.getAllProducts ()", cn);

            reader = cmd.ExecuteReader();

            categoriacombo.Items.Clear();
            categoriacombo.Items.Add("Todos");
            while (reader.Read())
            {
                categoriacombo.Items.Add(reader["categoria"].ToString());
            };

            reader.Close();

            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            cmd = new SqlCommand("SELECT DISTINCT destinatario FROM perf.getAllProducts () WHERE destinatario IS NOT NULL", cn);

            reader = cmd.ExecuteReader();

            destinatariocombo.Items.Clear();
            destinatariocombo.Items.Add("Todos");
            while (reader.Read())
            {
                destinatariocombo.Items.Add(reader["destinatario"].ToString());
            };

            reader.Close();

            cn.Close();
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

        private DataTable getClientCupons()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.getClientCupon ('" + C.Email + "')", cn);

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

        private void getClientContacts()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmdDefault = new SqlCommand("SELECT * FROM perf.clientDefaultContact ('" + C.Email + "')", cn);
            SqlDataReader readerdef = cmdDefault.ExecuteReader();
            readerdef.Read();
            int contactid = -1;
            try
            {
               contactid = (int)readerdef["id"];
            }
            catch (InvalidOperationException)
            {
            }

            cn.Close();

            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.clientContacts ('" + C.Email + "')", cn);

            SqlDataReader reader = cmd.ExecuteReader();
            ContactosList.Clear();

            while (reader.Read())
            {
                Contacto C = new Contacto();
                C.Id = (int)reader["id"];
                if (contactid == C.Id)
                    C.Default = true;
                else
                    C.Default = false;
                C.Telemovel = reader["telemovel"].ToString();
                C.Codigopostal = reader["codigo_postal"].ToString();
                C.Pais = reader["pais"].ToString();
                C.Endereco = reader["endereco"].ToString();
                C.Apartamento = reader["apartamento"].ToString();
                C.Localidade = reader["localidade"].ToString();
   
                ContactosList.Add(C);
            }


            cn.Close();

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

        private DataTable getCompraProducts()
        {
            if (!verifySGBDConnection())
                throw new Exception("Failed to connect to database. \n ERROR");

            SqlCommand cmd = new SqlCommand("SELECT * FROM perf.getProductsFromBuy ('" + Compra.Numero + "')", cn);

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


        private void fecharoffline_Click_1(object sender, EventArgs e)
        {
            compraoffline.Visible = false;
        }

        public void RemoveText(object sender, EventArgs e)
        {
            if (pesquisa.Text == "Pesquisar...")
            {
                pesquisa.Text = "";
            }

            if (cupontextbox.Text == "Inserir Cupão...")
            {
                cupontextbox.Text = "";
            }
        }

        public void AddText(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(pesquisa.Text))
                pesquisa.Text = "Pesquisar...";

            if (string.IsNullOrWhiteSpace(cupontextbox.Text))
                cupontextbox.Text = "Inserir Cupão...";
        }

        private void addcupon_Click(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("perf.clientUsesCupon", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            Console.WriteLine(cupontextbox.Text);
            cmd.Parameters.AddWithValue("@cupao_id", cupontextbox.Text);
            cmd.Parameters.AddWithValue("@cliente_email", C.Email);
            cmd.Parameters.Add("@responseMessage", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;

            String rm = "" ;

            try
            {
                cmd.ExecuteNonQuery();
                rm = cmd.Parameters["@responseMessage"].Value.ToString();

            }
            catch (Exception ex)
            {
                throw new Exception("Failed to login. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if (rm.Equals("Success"))
                {
                    tabControl1_SelectedIndexChanged(tabControl1, null);
                    loadInfo(C.Email);
                    MessageBox.Show("Cupão Adicionado com sucesso!");
                }
                else
                    MessageBox.Show("Cupão Inválido!");
            }


            cn.Close();
        }

        private void fecharproduto_Click(object sender, EventArgs e)
        {
            Produto.Visible = false;
        }

        private void searchProducts()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("perf.getProductFilters", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            if (!pesquisa.Text.Equals("") && !pesquisa.Text.Equals("Pesquisar..."))
            {
                cmd.Parameters.AddWithValue("@nome", pesquisa.Text);
            }

            if (marcacombo.SelectedIndex > 0)
            {
                cmd.Parameters.AddWithValue("@marca", marcacombo.SelectedItem.ToString());
            }

            if (categoriacombo.SelectedIndex > 0)
            {
                cmd.Parameters.AddWithValue("@categoria", categoriacombo.SelectedItem.ToString());
            }

            if (destinatariocombo.SelectedIndex > 0)
            {
                cmd.Parameters.AddWithValue("@destinatario", destinatariocombo.SelectedItem.ToString());
            }

            if (orderby.SelectedIndex > -1)
            {
                cmd.Parameters.AddWithValue("@orderby", orderby.SelectedItem.ToString());
            }

            if (orderdescasc.SelectedIndex > -1)
            {
                cmd.Parameters.AddWithValue("@ordem", orderdescasc.SelectedItem.ToString());
            }

            SqlDataReader reader = cmd.ExecuteReader();


            ProdutosList.Clear();

            while(reader.Read())
            {

                Console.WriteLine("AQUI1");
                Produto P = new Produto();
                
                P.Id = (int)reader["id"];
                P.Preco = (double)reader["preco"];
                 if (!DBNull.Value.Equals(reader["tamanho"]))
                P.Familiaolfativa = reader["familiaolfativa"].ToString();
                P.Categoria = reader["categoria"].ToString();
                P.Nome = reader["nome"].ToString();
                P.Marca = reader["marca"].ToString();
                P.Linha = reader["linha"].ToString();
                if (!DBNull.Value.Equals(reader["tamanho"]))
                    P.Tamanho = Convert.ToInt16(reader["tamanho"]);
                P.Descricao = reader["descricao"].ToString();
                P.Imagem = reader["imagem"].ToString();
                P.Stock = Convert.ToInt16(reader["stock"]);
                P.Destinatario = reader["destinatario"].ToString();
                P.Deleted = (bool)reader["deleted"];
                Console.WriteLine(P.Id);

                ProdutosList.Add(P);
        }



        cn.Close();
        }

        private void search_Click(object sender, EventArgs e)
        {
            searchProducts();
            lojagrid.DataSource = ProdutosList.Select(o => new
            { Nome = o.Nome, Marca = o.Marca, Categoria = o.Categoria, Destinatário = o.Destinatario, Preço = o.Preco }).ToList();
        }
    }
}
