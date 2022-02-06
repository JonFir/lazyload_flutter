import 'package:dart_lesson/factories/di_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/*
IoC Инверсия управления. Позволяет изменить направление зависмостей. 

DI - внедрение зависимостей. Когда класс получает зависмость из вне.
 И не контролирует этот процесс

DI container - это класс который создает зависимости и внедряет их.

Плюсы:
* Полная незвисимость классов
* Ясность. При вызове или просмотре конструктора видно, 
что необходимо для работы класса
* Позволяет использовать инверсию зависмостей
* МОжно расставлять const конструкторы
---

Service locator - это класс которые создает зависмости и используется
 для получения этих зависмостей.

 Плюс:
 * Меньше кода
 * Позволяет использовать инверсию зависмостей
*/

abstract class AppFactory {
  Widget makeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await GetIt.instance.allReady();
  final appFactory = GetIt.instance<AppFactory>();
  final app = appFactory.makeApp();
  runApp(app);
}
