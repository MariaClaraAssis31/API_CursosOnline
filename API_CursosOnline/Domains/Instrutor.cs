using System;
using System.Collections.Generic;

namespace API_CursosOnline.Domains;

public partial class Instrutor
{
    public int InstrutorID { get; set; }

    public string Nome { get; set; } = null!;

    public string Especializacao { get; set; } = null!;
}
