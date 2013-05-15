package dropoffbins

/**
 * A recycling drop-off bin.
 */
class Bin {

    String name
    String streetAddress
    String note
    String lat
    String lng

    static hasMany = [reports: Report]

    static mapping = {
        cache true
    }

    static constraints = {
    }

    String toString() { name }
}
