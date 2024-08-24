import 'mylib.dart' as empManager;

double extraPayPerHr = 0;

void main() {
  var william = new empManager.Employee("Manager", "Madrid", 5000, 7);

  if (william.salary >= 4000) {
    extraPayPerHr = 10;
  } else {
    extraPayPerHr = 20;
  }

  double totalSalary = william.salary + (william.overtimeHr * extraPayPerHr);
  print('');
  print('Total Salary = $totalSalary');
}
