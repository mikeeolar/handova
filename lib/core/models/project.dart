class Project {
  final String id;
  final String projectTitle;
  final double amountRaised;
  final double totalAmount;
  final int donors;
  final int days;
  final String imageUrl;
  bool isBookmarked;

  Project({
    required this.id,
    required this.projectTitle,
    required this.amountRaised,
    required this.totalAmount,
    required this.donors,
    required this.days,
    required this.imageUrl,
    this.isBookmarked = false,
  });
}
