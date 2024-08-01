class LicenseEntity {
  final int id;
  final int mektepId;
  final String owner;
  final String license;
  final int status;
  final DateTime dateCreated;
  final DateTime dateExpire;
  final DateTime dateUpadate;

  LicenseEntity({
    required this.id,
    required this.mektepId,
    required this.owner,
    required this.license,
    required this.status,
    required this.dateCreated,
    required this.dateExpire,
    required this.dateUpadate,
  });
}
