using System;
using System.Collections.Generic;

namespace API_CursosOnline.Domains;

public partial class Curso
{
    public int CursoID { get; set; }

    public string Nome { get; set; } = null!;

    public int CargaHoraria { get; set; }

    public virtual ICollection<Aluno> Aluno { get; set; } = new List<Aluno>();
}
