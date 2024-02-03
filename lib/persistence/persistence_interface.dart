abstract class Persistence {
  loadSingle(String id) {}

  loadCollection(List<int> ids) {}

  saveSingle(Map<String, Object?> resource) {}

  saveCollection(List<Map<String, Object?>> resources) {}
}
