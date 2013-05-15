package dropoffbins

import java.text.SimpleDateFormat

/**
 * A report of the status of a Bin.
 * Not distinguishing paper/cardboard versus plastic/glass sections,
 * because most recyclers need to drop off both, and the paper/cardboard
 * sections always fill up first.
 */
class Report {

    Status status
    Date dateCreated    // automatic timestamp

    static belongsTo = [bin: Bin]

    static mapping = {
        cache true
    }

    static constraints = {
    }

    String toString() {
        // todo: relative, friendly format
        def ts = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateCreated)
        "$ts $status"
    }
}
