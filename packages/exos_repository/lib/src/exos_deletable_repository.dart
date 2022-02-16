import 'dart:async';

import 'package:exos_repository/exos_repository.dart';

mixin DeletableRepository<T, U> on Repository<T, U> {
  FutureOr<U> deletById(U id);
  FutureOr<List<U>> deleteAll();
}