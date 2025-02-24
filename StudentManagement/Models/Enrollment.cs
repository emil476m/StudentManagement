namespace StudentManagement.Models;

public class Enrollment
{
    public int Id { get; set; }
    
   
    public Student Student { get; set; }
    
    public Course Course { get; set; }
    public string FinalGrade { get; set; }
}