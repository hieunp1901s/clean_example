//entiy sẽ thuần language specific, nghĩa là thuần dart code và không có thêm bất cứ thư viện nào

class Article {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}
