// a class that we will import
class Employee {
  // I'm finding it easier to preset the props with defaults rather than going
  // through the nullable vs non-nullable errors afterwards. 
  String jobTitle = "";
  String location = '';
  double salary = 0;
  double overtimeHr = 0; // number of overtime hours

  Employee(this.jobTitle, this.location, this.salary, this.overtimeHr);
}
