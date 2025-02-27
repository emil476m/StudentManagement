using Microsoft.EntityFrameworkCore;
using StudentManagement.Models;

namespace StudentManagement;

public class DatabaseContext : DbContext
{
    public DbSet<Course> Courses { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Student> Students { get; set; }
    public DbSet<Instructor> Instructors { get; set; }
    public DbSet<Department> Departments { get; set; }
    
    public string DbPath { get; }

    public DatabaseContext()
    {
        var folder = Environment.SpecialFolder.LocalApplicationData;
        var path = Environment.GetFolderPath(folder);
        DbPath = System.IO.Path.Join(path, "StudentManagement.db");
        
        Console.WriteLine(DbPath);
    }
    protected override void OnConfiguring(DbContextOptionsBuilder options)
        => options.UseSqlite($"Data Source={DbPath}");
    
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Enrollment>()
            .HasOne<Student>(s => s.Student);
        
        
        modelBuilder.Entity<Enrollment>()
            .HasOne<Course>(s => s.Course);

        modelBuilder.Entity<Course>()
            .HasOne<Instructor>(e => e.Instructor);
        
        modelBuilder.Entity<Department>()
            .HasOne<Instructor>(e => e.DepartmentHead);
    }
}