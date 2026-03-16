using System;
using System.Collections.Generic;

namespace API_CursosOnline.Domains;

public partial class Aluno
{
    public int AlunoID { get; set; }

    public string? Nome { get; set; }

    public string? Email { get; set; }

    public virtual ICollection<Curso> Curso { get; set; } = new List<Curso>();
}
