namespace StudentManagement.Models;

public class Department
{
    public int Id { get; set; }
    public string Name { get; set; }
    public double Budget { get; set; }
    public DateTime StartDate { get; set; }
    public Instructor DepartmentHead { get; set; }
}