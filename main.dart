import 'dart:io';

void main() {
  List students = [];
  List teachers = [];
  List departments = [];

  int choice;

  do {
    // ================= MAIN MENU =================

    print('\n===== COLLEGE MANAGEMENT SYSTEM =====');
    print('1. Students');
    print('2. Teachers');
    print('3. Departments');
    print('4. Exit');

    choice = getNumber('Enter your choice: ');

    // ================= STUDENTS =================

    if (choice == 1) {
      int studentChoice;

      do {
        print('\n===== STUDENT MENU =====');
        print('1. Add Student');
        print('2. Show Students');
        print('3. Edit Student');
        print('4. Remove Student');
        print('5. Back');

        studentChoice = getNumber('Enter your choice: ');

        // Add Student
        if (studentChoice == 1) {
          String name;
          String fatherName;
          int roll;
          String year = '';
          String department = '';

          // Student Name
          print('\nEnter student name:');
          name = stdin.readLineSync()!;

          while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
            print('Error! Name must contain alphabets only.');
            print('Enter student name again:');
            name = stdin.readLineSync()!;
          }

          // Father Name
          print('Enter father name:');
          fatherName = stdin.readLineSync()!;

          while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(fatherName)) {
            print('Error! Father name must contain alphabets only.');
            print('Enter father name again:');
            fatherName = stdin.readLineSync()!;
          }

          // Roll Number
          roll = getNumber('Enter student roll no: ');

          // Year
          print('\nSelect Student Year:');
          print('1. 1st Year');
          print('2. 2nd Year');

          while (true) {
            int yearChoice = getNumber('Enter your choice: ');

            if (yearChoice == 1) {
              year = '1st Year';
              break;
            } else if (yearChoice == 2) {
              year = '2nd Year';
              break;
            } else {
              print('Please select 1 or 2.');
            }
          }

          // Department
          if (departments.isEmpty) {
            print('\nNo department available.');
            print('Please add a department first.');
            break;
          }

          print('\nSelect Student Department:');

          for (int i = 0; i < departments.length; i++) {
            print('${i + 1}. ${departments[i]}');
          }

          while (true) {
            int departmentChoice =
                getNumber('Enter department choice: ');

            if (departmentChoice >= 1 &&
                departmentChoice <= departments.length) {
              department = departments[departmentChoice - 1];
              break;
            } else {
              print('Please select a valid department.');
            }
          }

          students.add({
            'name': name,
            'fatherName': fatherName,
            'roll': roll,
            'year': year,
            'department': department
          });

          print('Student added successfully!');
        }

        // Show Students
        else if (studentChoice == 2) {
          print('\n===== STUDENTS =====');

          if (students.isEmpty) {
            print('No students found.');
          } else {
            for (int i = 0; i < students.length; i++) {
              print('\nStudent ${i + 1}');
              print('Name: ${students[i]['name']}');
              print('Father Name: ${students[i]['fatherName']}');
              print('Roll No: ${students[i]['roll']}');
              print('Year: ${students[i]['year']}');
              print('Department: ${students[i]['department']}');
            }
          }
        }

        // Edit Student
        else if (studentChoice == 3) {
          if (students.isEmpty) {
            print('\nNo students found.');
          } else {
            print('\n===== SELECT STUDENT TO EDIT =====');

            for (int i = 0; i < students.length; i++) {
              print('${i + 1}. ${students[i]['name']}');
            }

            int number = getNumber('Enter student number: ');

            if (number >= 1 && number <= students.length) {
              int index = number - 1;

              // New Name
              print('\nEnter new student name:');
              String newName = stdin.readLineSync()!;

              while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(newName)) {
                print('Error! Name must contain alphabets only.');
                print('Enter student name again:');
                newName = stdin.readLineSync()!;
              }

              // New Father Name
              print('Enter new father name:');
              String newFatherName = stdin.readLineSync()!;

              while (!RegExp(r'^[a-zA-Z ]+$')
                  .hasMatch(newFatherName)) {
                print('Error! Father name must contain alphabets only.');
                print('Enter father name again:');
                newFatherName = stdin.readLineSync()!;
              }

              // New Roll Number
              int newRoll =
                  getNumber('Enter new roll no: ');

              // New Year
              print('\nSelect new year:');
              print('1. 1st Year');
              print('2. 2nd Year');

              String newYear;

              while (true) {
                int newYearChoice =
                    getNumber('Enter your choice: ');

                if (newYearChoice == 1) {
                  newYear = '1st Year';
                  break;
                } else if (newYearChoice == 2) {
                  newYear = '2nd Year';
                  break;
                } else {
                  print('Please select 1 or 2.');
                }
              }

              // New Department
              String newDepartment =
                  students[index]['department'];

              if (departments.isNotEmpty) {
                print('\nSelect new department:');

                for (int i = 0; i < departments.length; i++) {
                  print('${i + 1}. ${departments[i]}');
                }

                int deptChoice =
                    getNumber('Enter department choice: ');

                if (deptChoice >= 1 &&
                    deptChoice <= departments.length) {
                  newDepartment =
                      departments[deptChoice - 1];
                }
              }

              students[index] = {
                'name': newName,
                'fatherName': newFatherName,
                'roll': newRoll,
                'year': newYear,
                'department': newDepartment
              };

              print('Student updated successfully!');
            } else {
              print('Invalid student number.');
            }
          }
        }

        // Remove Student
        else if (studentChoice == 4) {
          if (students.isEmpty) {
            print('\nNo students found.');
          } else {
            print('\n===== REMOVE STUDENT =====');

            for (int i = 0; i < students.length; i++) {
              print('${i + 1}. ${students[i]['name']}');
            }

            int number =
                getNumber('Enter student number: ');

            if (number >= 1 && number <= students.length) {
              students.removeAt(number - 1);
              print('Student removed successfully!');
            } else {
              print('Invalid student number.');
            }
          }
        }

        else if (studentChoice == 5) {
          print('Going back to main menu...');
        }

        else {
          print('Invalid choice!');
        }

      } while (studentChoice != 5);
    }

    // ================= TEACHERS =================

    else if (choice == 2) {
      int teacherChoice;

      do {
        print('\n===== TEACHER MENU =====');
        print('1. Add Teacher');
        print('2. Show Teachers');
        print('3. Edit Teacher');
        print('4. Remove Teacher');
        print('5. Back');

        teacherChoice = getNumber('Enter your choice: ');

        // Add Teacher
        if (teacherChoice == 1) {
          String teacher;
          int id;
          String subject;

          // Teacher Name
          print('\nEnter teacher name:');
          teacher = stdin.readLineSync()!;

          while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(teacher)) {
            print('Error! Name must contain alphabets only.');
            print('Enter teacher name again:');
            teacher = stdin.readLineSync()!;
          }

          // ID Card
          id = getNumber('Enter teacher ID card: ');

          // Subject
          print('Enter teacher subject:');
          subject = stdin.readLineSync()!;

          while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(subject)) {
            print('Error! Subject must contain alphabets only.');
            print('Enter subject again:');
            subject = stdin.readLineSync()!;
          }

          teachers.add({
            'name': teacher,
            'id': id,
            'subject': subject
          });

          print('Teacher added successfully!');
        }

        // Show Teachers
        else if (teacherChoice == 2) {
          print('\n===== TEACHERS =====');

          if (teachers.isEmpty) {
            print('No teachers found.');
          } else {
            for (int i = 0; i < teachers.length; i++) {
              print('\nTeacher ${i + 1}');
              print('Name: ${teachers[i]['name']}');
              print('ID Card: ${teachers[i]['id']}');
              print('Subject: ${teachers[i]['subject']}');
            }
          }
        }

        // Edit Teacher
        else if (teacherChoice == 3) {
          if (teachers.isEmpty) {
            print('\nNo teachers found.');
          } else {
            print('\n===== SELECT TEACHER TO EDIT =====');

            for (int i = 0; i < teachers.length; i++) {
              print('${i + 1}. ${teachers[i]['name']}');
            }

            int number =
                getNumber('Enter teacher number: ');

            if (number >= 1 && number <= teachers.length) {
              int index = number - 1;

              // New Teacher Name
              print('Enter new teacher name:');
              String newName = stdin.readLineSync()!;

              while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(newName)) {
                print('Error! Name must contain alphabets only.');
                print('Enter teacher name again:');
                newName = stdin.readLineSync()!;
              }

              // New ID
              int newId =
                  getNumber('Enter new ID card: ');

              // New Subject
              print('Enter new subject:');
              String newSubject = stdin.readLineSync()!;

              while (!RegExp(r'^[a-zA-Z ]+$')
                  .hasMatch(newSubject)) {
                print('Error! Subject must contain alphabets only.');
                print('Enter subject again:');
                newSubject = stdin.readLineSync()!;
              }

              teachers[index] = {
                'name': newName,
                'id': newId,
                'subject': newSubject
              };

              print('Teacher updated successfully!');
            } else {
              print('Invalid teacher number.');
            }
          }
        }

        // Remove Teacher
        else if (teacherChoice == 4) {
          if (teachers.isEmpty) {
            print('\nNo teachers found.');
          } else {
            print('\n===== REMOVE TEACHER =====');

            for (int i = 0; i < teachers.length; i++) {
              print('${i + 1}. ${teachers[i]['name']}');
            }

            int number =
                getNumber('Enter teacher number: ');

            if (number >= 1 && number <= teachers.length) {
              teachers.removeAt(number - 1);
              print('Teacher removed successfully!');
            } else {
              print('Invalid teacher number.');
            }
          }
        }

        else if (teacherChoice == 5) {
          print('Going back to main menu...');
        }

        else {
          print('Invalid choice!');
        }

      } while (teacherChoice != 5);
    }

    // ================= DEPARTMENTS =================

    else if (choice == 3) {
      int departmentChoice;

      do {
        print('\n===== DEPARTMENT MENU =====');
        print('1. Add Department');
        print('2. Show Departments');
        print('3. Edit Department');
        print('4. Remove Department');
        print('5. Back');

        departmentChoice =
            getNumber('Enter your choice: ');

        // Add Department
        if (departmentChoice == 1) {
          String department;

          print('\nEnter department name:');
          department = stdin.readLineSync()!;

          while (!RegExp(r'^[a-zA-Z ]+$').hasMatch(department)) {
            print('Error! Department must contain alphabets only.');
            print('Enter department name again:');
            department = stdin.readLineSync()!;
          }

          departments.add(department);

          print('Department added successfully!');
        }

        // Show Departments
        else if (departmentChoice == 2) {
          print('\n===== DEPARTMENTS =====');

          if (departments.isEmpty) {
            print('No departments found.');
          } else {
            for (int i = 0; i < departments.length; i++) {
              print('${i + 1}. ${departments[i]}');
            }
          }
        }

        // Edit Department
        else if (departmentChoice == 3) {
          if (departments.isEmpty) {
            print('\nNo departments found.');
          } else {
            print('\n===== SELECT DEPARTMENT TO EDIT =====');

            for (int i = 0; i < departments.length; i++) {
              print('${i + 1}. ${departments[i]}');
            }

            int number =
                getNumber('Enter department number: ');

            if (number >= 1 &&
                number <= departments.length) {
              print('Enter new department name:');
              String newDepartment =
                  stdin.readLineSync()!;

              while (!RegExp(r'^[a-zA-Z ]+$')
                  .hasMatch(newDepartment)) {
                print(
                    'Error! Department must contain alphabets only.');
                print('Enter department name again:');
                newDepartment = stdin.readLineSync()!;
              }

              departments[number - 1] = newDepartment;

              print('Department updated successfully!');
            } else {
              print('Invalid department number.');
            }
          }
        }

        // Remove Department
        else if (departmentChoice == 4) {
          if (departments.isEmpty) {
            print('\nNo departments found.');
          } else {
            print('\n===== REMOVE DEPARTMENT =====');

            for (int i = 0; i < departments.length; i++) {
              print('${i + 1}. ${departments[i]}');
            }

            int number =
                getNumber('Enter department number: ');

            if (number >= 1 &&
                number <= departments.length) {
              departments.removeAt(number - 1);
              print('Department removed successfully!');
            } else {
              print('Invalid department number.');
            }
          }
        }

        else if (departmentChoice == 5) {
          print('Going back to main menu...');
        }

        else {
          print('Invalid choice!');
        }

      } while (departmentChoice != 5);
    }

    // ================= EXIT =================

    else if (choice == 4) {
      print('\nThank you for using College Management System!');
    }

    else {
      print('\nInvalid choice!');
    }

  } while (choice != 4);
}


// ================= NUMBER INPUT FUNCTION =================

int getNumber(String message) {
  while (true) {
    print(message);

    String input = stdin.readLineSync()!;

    int? number = int.tryParse(input);

    if (number != null) {
      return number;
    } else {
      print('Error! Please enter numbers only.');
    }
  }
}