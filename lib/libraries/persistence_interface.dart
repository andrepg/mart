abstract class Persistence {
  loadSingleResource(String id) {}

  loadCollectionResource(List<int> ids) {}

  saveSingleResource(Map<String, Object?> resource) {}

  saveCollectionResource(List<Map<String, Object?>> resources) {}
}
