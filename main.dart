import 'dart:io';

Map<String, int> students = {
  'Азамат': 87,
  'Айдана': 92,
  'Бекзат': 44,
  'Нурлан': 77,
  'Алина': 50,
};
void showStudents() {
  if (students.isEmpty) {
    print('Список студентов пуст.');
    return;
  }

  print('\n--- Список студентов ---');

  students.forEach((name, grade) {
    print('$name — $grade баллов');
  });
}

String getGradeStatus(int grade) {
  if (grade >= 90 && grade <= 100) {
    return 'Отлично';
  } else if (grade >= 60) {
    return 'Хорошо';
  } else if (grade >= 40) {
    return 'Удовлетворительно';
  } else {
    return 'Неудовлетворительно';
  }
}

double calculateAverage() {
  if (students.isEmpty) {
    return 0;
  }

  int sum = 0;

  for (int grade in students.values) {
    sum += grade;
  }

  return sum / students.length;
}

void findStudent(String name) {
  if (students.containsKey(name)) {
    int grade = students[name]!;
    print('$name — $grade баллов');
    print('Результат: ${getGradeStatus(grade)}');
  } else {
    print('Студент не найден');
  }
}

// Задание 5. Добавление студента
void addStudent(String name, int grade) {
  if (students.containsKey(name)) {
    print('Такой студент уже существует!');
  } else if (grade < 0 || grade > 100) {
    print('Оценка должна быть от 0 до 100!');
  } else {
    students[name] = grade;
    print('Студент успешно добавлен!');
  }
}

// Задание 7. Удаление студента
void removeStudent(String name) {
  if (students.containsKey(name)) {
    students.remove(name);
    print('Студент удалён!');
  } else {
    print('Студент не найден!');
  }
}

void bestStudent() {
  if (students.isEmpty) {
    print('Список студентов пуст.');
    return;
  }

  String bestName = '';
  int bestGrade = -1;

  students.forEach((name, grade) {
    if (grade > bestGrade) {
      bestGrade = grade;
      bestName = name;
    }
  });

  print('Лучший студент: $bestName — $bestGrade баллов');
}

List<String> filterStudents() {
  List<String> result = [];

  students.forEach((name, grade) {
    if (grade >= 70) {
      result.add(name);
    }
  });

  return result;
}

void main() {
  while (true) {
    print('\n===== ЭЛЕКТРОННЫЙ ЖУРНАЛ =====');
    print('1. Показать всех студентов');
    print('2. Найти студента');
    print('3. Добавить студента');
    print('4. Показать средний балл');
    print('5. Выход');
    print('6. Удалить студента');
    print('7. Лучший студент');
    print('8. Студенты с оценкой 70+');
    print('==============================');
    stdout.write('Выберите действие: ');

    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        showStudents();
        break;

      case '2':
        stdout.write('Введите имя студента: ');
        String name = stdin.readLineSync() ?? '';
        findStudent(name);
        break;

      case '3':
        stdout.write('Введите имя студента: ');
        String name = stdin.readLineSync() ?? '';

        stdout.write('Введите оценку: ');
        int? grade = int.tryParse(stdin.readLineSync() ?? '');

        if (grade == null) {
          print('Ошибка! Введите число.');
        } else {
          addStudent(name, grade);
        }
        break;

      case '4':
        print('Средний балл: ${calculateAverage().toStringAsFixed(2)}');
        break;

      case '5':
        print('Выход из программы.');
        return;

      case '6':
        stdout.write('Введите имя студента: ');
        String name = stdin.readLineSync() ?? '';
        removeStudent(name);
        break;

      case '7':
        bestStudent();
        break;

      case '8':
        List<String> result = filterStudents();

        if (result.isEmpty) {
          print('Студентов с оценкой 70 и выше нет.');
        } else {
          print('Студенты с оценкой 70 и выше:');
          for (String name in result) {
            print(name);
          }
        }
        break;

      default:
        print('Неверный выбор! Попробуйте снова.');
    }
  }
}
