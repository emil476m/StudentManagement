using Microsoft.EntityFrameworkCore;
using StudentManagement.Models;

namespace StudentManagement;

public class DatabaseContext : DbContext
{
    public DbSet<Course> Courses { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Student> Students { get; set; }
    
    public string DbPath { get; }

    protected DatabaseContext()
    {
        var folder = Environment.SpecialFolder.LocalApplicationData;
        var path = Environment.GetFolderPath(folder);
        DbPath = System.IO.Path.Join(path, "StudentManagement.db");
        
        Console.WriteLine(DbPath);
    }
    protected override void OnConfiguring(DbContextOptionsBuilder options)
        => options.UseSqlite($"Data Source={DbPath}");
}