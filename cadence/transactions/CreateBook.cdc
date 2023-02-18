// read more about Cadence transactions here https://developers.flow.com/cadence/language/transactions
import Library from 0x01

transaction (_title: String, _author: String, _year: UInt16) {

    prepare(signer: AuthAccount) {  
    }

    pre {}

    execute {
        Library.createBook(title: _title, author: _author, year: _year)
        log("Book Created")
    }

    post {}
}