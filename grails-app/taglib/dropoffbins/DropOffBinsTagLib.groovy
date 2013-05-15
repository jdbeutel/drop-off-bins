package dropoffbins

class DropOffBinsTagLib {

    def packString = { attrs, body ->
        def s = '' + body()
        out << s.split('\n').join(' ')
    }

}
