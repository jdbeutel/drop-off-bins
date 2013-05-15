import dropoffbins.Bin
import dropoffbins.BinService

class BootStrap {

    BinService binService

    def init = { servletContext ->
        binService.loadFixtures()
    }

    def destroy = {
    }
}
