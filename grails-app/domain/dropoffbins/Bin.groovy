package dropoffbins

/**
 * A recycling drop-off bin.
 */
class Bin {

    String name // of location
    String lat, lng
    String streetAddress, city, state, zip
    String note

    static hasMany = [reports: Report]

    static mapping = {
        cache true
    }

    static constraints = {
        note nullable: true
    }

    Bin(String name, String lat, String lng, String streetAddress, String city, String state, String zip, String note = null) {
        this.name = name
        this.lat = lat
        this.lng = lng
        this.streetAddress = streetAddress
        this.city = city
        this.state = state
        this.zip = zip
        this.note = note
    }

    String toString() { name }
}
