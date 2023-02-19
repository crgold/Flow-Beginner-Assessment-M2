
pub contract Library {
// state variables
    pub var bookList: [Book];
    pub var userList: {Address: [UInt256]};


    // create a struct to hold our book information
    pub struct Book {
        pub let title: String;
        pub let author: String;
        pub let year: UInt16;

        init(_title:String, _author: String, _year: UInt16) {
            self.title = _title;
            self.author = _author;
            self.year = _year;
        }
    }

    // create a book and add it to the array of books
    // index of book array will serve as the bookID
    pub fun createBook(title: String, author: String, year: UInt16) {
        let newBook = Book(_title: title, _author: author, _year: year);
        self.bookList.append(newBook);
    }

    // check out a book and add it to the array of books
    // which is mapped to an account.
    pub fun checkoutBook(account: Address, bookID: UInt256) {
        if self.userList[account] == nil {
            self.userList[account] = [bookID]
        }
        else {
            self.userList[account]?.append(bookID);
        }    
        log(self.userList[account]?.length)
    }

    // return a book and remove it from the array of books
    // which is mapped to an account.
    pub fun returnBook(bookID: UInt256, account: Address) {
        assert(self.userList[account] != nil, message: "This account does not exist")
        for index, element in self.userList[account]! {
            if (element == bookID) {
                self.userList[account]!.remove(at: index);
            }
        }
        log(self.userList[account]?.length)
    }

    // return list of available books
    pub fun getBookList() : [Book] {
        return self.bookList;
    }

    // return list of books a user hs checked out
    pub fun getUsersBookList(_account: Address) : [UInt256] {
        return self.userList[_account]!;
    }

    // init our variables
    init() {
        self.bookList = [];
        self.userList = {};
    }
}    
