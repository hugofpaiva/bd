using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Perfumaria
{
    public partial class Main : Form
    {

        private SqlConnection cn;
        public Main()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
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

        //LOGIN
        private void button1_Click(object sender, EventArgs e)
        {
            bool type = false;
            String rm = null;
            DialogResult result;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("perf.Login", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", emaillogin.Text);
            cmd.Parameters.AddWithValue("@password", pwlogin.Text);
            cmd.Parameters.Add("@responseMessage", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@type", SqlDbType.Bit).Direction = ParameterDirection.Output;



            try
            {
                cmd.ExecuteNonQuery();
                rm = cmd.Parameters["@responseMessage"].Value.ToString();
                type = (bool)cmd.Parameters["@type"].Value;
                Console.WriteLine(rm);
                
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to login. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if(!rm.Equals("Invalid login")) {
                    // Funcionário
                    if (type)
                        result = MessageBox.Show(rm, "caption", MessageBoxButtons.OK);
                    // Cliente
                    else
                        result = MessageBox.Show(rm, "caption", MessageBoxButtons.OK);
                    
                    if (result == DialogResult.OK)
                    {
                        this.Close();
                        Cliente cliente = new Cliente();
                        cliente.Show();
                    }
                } 
                else {
                    MessageBox.Show(rm);
                }  
                
                cn.Close();
            }
        }

        //REGISTO
        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click_1(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void newsletter_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Registo_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
