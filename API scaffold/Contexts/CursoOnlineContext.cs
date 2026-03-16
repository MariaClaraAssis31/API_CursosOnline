using System;
using System.Collections.Generic;
using API_CursosOnline.Domains;
using Microsoft.EntityFrameworkCore;

namespace API_CursosOnline.Contexts;

public partial class CursoOnlineContext : DbContext
{
    public CursoOnlineContext()
    {
    }

    public CursoOnlineContext(DbContextOptions<CursoOnlineContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Aluno> Aluno { get; set; }

    public virtual DbSet<Curso> Curso { get; set; }

    public virtual DbSet<Instrutor> Instrutor { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=CursoOnline;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Aluno>(entity =>
        {
            entity.HasKey(e => e.AlunoID).HasName("PK__Aluno__C1967C6FAFD4A5E3");

            entity.Property(e => e.Email)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(60)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Curso>(entity =>
        {
            entity.HasKey(e => e.CursoID).HasName("PK__Curso__7E023A37F7C62481");

            entity.Property(e => e.Nome)
                .HasMaxLength(70)
                .IsUnicode(false);

            entity.HasMany(d => d.Aluno).WithMany(p => p.Curso)
                .UsingEntity<Dictionary<string, object>>(
                    "Matricula",
                    r => r.HasOne<Aluno>().WithMany()
                        .HasForeignKey("AlunoID")
                        .HasConstraintName("FK_MatriculaID_Aluno"),
                    l => l.HasOne<Curso>().WithMany()
                        .HasForeignKey("CursoID")
                        .HasConstraintName("FK_MatriculaID_Curso"),
                    j =>
                    {
                        j.HasKey("CursoID", "AlunoID").HasName("PK_MatriculaID");
                    });
        });

        modelBuilder.Entity<Instrutor>(entity =>
        {
            entity.HasKey(e => e.InstrutorID).HasName("PK__Instruto__096B84F4E5709554");

            entity.Property(e => e.Especializacao)
                .HasMaxLength(70)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(60)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
