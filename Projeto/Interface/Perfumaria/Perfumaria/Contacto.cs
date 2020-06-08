using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Perfumaria
{
	[Serializable()]
	class Contacto
	{
		private int id;
		private String utilizadoremail;
		private String telemovel;
		private bool visibilidade;
		private String codigopostal;
		private String pais;
		private String endereco;
		private String apartamento;
		private String localidade;





		public Contacto() : base()
		{
		}

		public int Id { get => id; set => id = value; }
		public string Utilizadoremail { get => utilizadoremail; set => utilizadoremail = value; }
		public string Telemovel { get => telemovel; set => telemovel = value; }
		public bool Visibilidade { get => visibilidade; set => visibilidade = value; }
		public string Codigopostal { get => codigopostal; set => codigopostal = value; }
		public string Pais { get => pais; set => pais = value; }
		public string Endereco { get => endereco; set => endereco = value; }
		public string Apartamento { get => apartamento; set => apartamento = value; }
		public string Localidade { get => localidade; set => localidade = value; }
	}
}
