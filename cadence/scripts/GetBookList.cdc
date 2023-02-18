import Library from 0x01

pub fun main() {
    for index, element in Library.getBookList() {
                log("Book ID: ".concat(index.toString()))
                log("Book Title: ".concat(element.title))
    }
}
