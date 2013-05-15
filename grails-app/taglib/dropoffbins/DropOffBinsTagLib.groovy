package dropoffbins

import java.text.SimpleDateFormat

class DropOffBinsTagLib {

    def lastReport = { attrs ->
        Bin bin = attrs.bin
        Report r = bin.lastReport()
        if (r) {
            // todo: relative, friendly format
            def ts = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(r.dateCreated)
            out << "${r.status} at $ts <br/>"
            out << '<img src="'     // double-quotes required for use within JavaScript param
            out << lastReportedStatusImg(attrs)
            out << '"/>'
        } else {
            out << 'no reports'
        }
    }

    def lastReportedStatusImg = { attrs ->
        Bin bin = attrs.bin
        Report r = bin.lastReport()
        if (r) {
            out << createLinkTo(dir: 'images', file: "${r.status}.png")
        } else {
            out << createLinkTo(dir: 'images/skin', file: "exclamation.png")
        }
    }

    def lastReportedStatusIcon = { attrs ->
        Bin bin = attrs.bin
        Report r = bin.lastReport()
        if (r) {
            out << createLinkTo(dir: 'images/icons', file: "${r.status}.png")
        } else {
            out << createLinkTo(dir: 'images/skin', file: "exclamation.png")
        }
    }
}
