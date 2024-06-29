void main(List <String>args){

  const book1 = Book("Hights", "Jacob Walter", 2017);
  const book2 = Book.bestseller("The Walk", 2022);

  
  book1.publishingDetails();
  book2.publishingDetails();
}
class Book{
  final String title;
  final String author;
  final int year;


  const Book(
    this.title,
    this.author,
    this.year,
    
  );
  const Book.bestseller(
    this.title,
    this.year,
  ): author = "Unknown";
  void publishingDetails(){
    print("Title: $title, Author: $author, Year: $year");
  }
}