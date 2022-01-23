import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/data/database/database_collections.dart';
import 'package:library_project/unilib/core/data/database/database_service_impl.dart';

import 'package:mockito/mockito.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';
import '../../generate_mocks.mocks.dart';

void main() {
  late HiveBoxNames hive;
  late UserModel user;
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;
  late BookDatabaseServiceImpl database;
  setUp(() {
    hive = HiveBoxNames.users;
    user = UserModel(email: 'dd@gmail.com', name: 'dd', password: '12345');
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();
    database = BookDatabaseServiceImpl();
  });

  group('database service impl', () {
    test('should put into data when value and HiveBoxName are passed in', () {
      // ARRANGE
      // create a stub that returns a hivebox
      when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);

      // ACT
      database.write(user, hive, 'data');

      // ASSERT
      verify(database.write(user, hive, 'data'));
      verifyNoMoreInteractions(mockHiveInterface);
    });
  });
}
