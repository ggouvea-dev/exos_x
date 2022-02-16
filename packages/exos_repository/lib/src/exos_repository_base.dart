import 'dart:async';

abstract class Repository<T, U> {
  FutureOr<T> findById(U id);
  FutureOr<List<T>> findAll();
  FutureOr<bool> save(T t);
  FutureOr<bool> salveAll(List<T> tList);
}