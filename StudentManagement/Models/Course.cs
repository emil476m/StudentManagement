using System.ComponentModel.DataAnnotations;

namespace StudentManagement.Models;

public class Course
{
    public int Id { get; set; }
    public string Title { get; set; }
    public Instructor Instructor { get; set; }
    public float Credits { get; set; }
}