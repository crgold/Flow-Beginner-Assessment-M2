
pub contract Library {
    pub var bookList: [Book];
    pub var userList: {Address: [UInt256]};


    pub struct Book {
        pub let title: String;
        pub let author: String;
        pub let year: UInt;

        init(_title:String, _author: String, _year: UInt) {
            self.title = _title;
            self.author = _author;
            self.year = _year;
        }
    }

    // create a book and add it to the array of books
    // index of book array will serve as the bookID
    pub fun createBook(title: String, author: String, year: UInt, account: Address) {
        let newBook = Book(_title: title, _author: author, _year: year);
        self.bookList.append(newBook);
    }

    pub fun checkoutBook(account: Address, bookID: UInt256) {
        self.userList[account]?.append(bookID);
    }

    pub fun returnBook(bookID: UInt256, account: Address) {
        assert(self.userList[account] != nil, message: "This account does not exist")
        for index, element in self.userList[account]! {
            if (element == bookID) {
                self.userList[account]!.remove(at: index);
            }
        }
    }

    pub fun getBookList() : [Book] {
        return self.bookList;
    }

    pub fun getUsersBookList(_account: Address) : [UInt256] {
        return self.userList[_account]!;
    }

    init() {
        self.bookList = [];
        self.userList = {};
    }
}