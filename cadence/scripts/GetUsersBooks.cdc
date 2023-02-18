import Library from 0x01

pub fun main(_account: Address) {

    let bookList = Library.getBookList()

    log("The books you have checked out are: ")
    for index, element in Library.getUsersBookList(_account: _account) {
                log(bookList[index].title)
    }
}