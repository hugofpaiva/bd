using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Perfumaria
{
    static class Program
    {

        public static bool OpenClient { get; set; }
        public static bool OpenFunc { get; set; }
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            OpenClient = false;
            OpenFunc = false;
            Application.Run(new Main());

            if (OpenClient)
            {
                Application.Run(new Cliente());
            } else if(OpenFunc)
            {
                Application.Run(new Funcionario());
            }
        }

    }

}
