void debugPrint(String str) {
  var isRelease = const bool.fromEnvironment('dart.vm.product');
  if (!isRelease) print(str);
}