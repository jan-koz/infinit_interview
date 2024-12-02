class PaginatedResponse<T> {
  final List<T> items;
  final int total;
  final int totalPages;
  final int currentPage;
  final bool hasMore;
  final String? nextUrl;

  PaginatedResponse({
    required this.items,
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.hasMore,
    this.nextUrl,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final pagination = json['pagination'] as Map<String, dynamic>;
    final data = json['data'] as List<dynamic>;

    return PaginatedResponse(
      items: data.map((e) => fromJson(e as Map<String, dynamic>)).toList(),
      total: pagination['total'] as int,
      totalPages: pagination['total_pages'] as int,
      currentPage: pagination['current_page'] as int,
      hasMore: pagination['next_url'] != null,
      nextUrl: pagination['next_url'] as String?,
    );
  }
}
