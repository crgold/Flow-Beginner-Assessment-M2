// read more about Cadence transactions here https://developers.flow.com/cadence/language/transactions
import Library from 0x01

transaction ( _account: Address, _bookID: UInt256) {

    prepare(signer: AuthAccount) {  
    }

    pre {}

    execute {
        Library.returnBook(bookID: _bookID, account: _account)
        log("Returned Book")
    }

    post {}
}