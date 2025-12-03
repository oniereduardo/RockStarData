class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});
}

class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});
}

class StoreException implements Exception {
  final String message;

  const StoreException({required this.message});
}
