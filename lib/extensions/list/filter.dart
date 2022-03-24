extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) wherecaluse) =>
      map((items) => items.where(wherecaluse).toList());
}
