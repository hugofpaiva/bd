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
    public partial class Form1 : Form
    {
        private SqlConnection cn;
        

        public Form1()
        {
            InitializeComponent();
            Console.WriteLine("Teste print na consola");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
 
            cn = getSGBDConnection();
            if(verifySGBDConnection()){
                textBox1.Text = "Conexão"; 
            } else
            {
                textBox1.Text = "NOP";
            }
 
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

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
