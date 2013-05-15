package dropoffbins



import org.junit.*
import grails.test.mixin.*

@TestFor(BinController)
@Mock(Bin)
class BinControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bin/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.binInstanceList.size() == 0
        assert model.binInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.binInstance != null
    }

    void testSave() {
        controller.save()

        assert model.binInstance != null
        assert view == '/bin/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bin/show/1'
        assert controller.flash.message != null
        assert Bin.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bin/list'

        populateValidParams(params)
        def bin = new Bin(params)

        assert bin.save() != null

        params.id = bin.id

        def model = controller.show()

        assert model.binInstance == bin
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bin/list'

        populateValidParams(params)
        def bin = new Bin(params)

        assert bin.save() != null

        params.id = bin.id

        def model = controller.edit()

        assert model.binInstance == bin
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bin/list'

        response.reset()

        populateValidParams(params)
        def bin = new Bin(params)

        assert bin.save() != null

        // test invalid parameters in update
        params.id = bin.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bin/edit"
        assert model.binInstance != null

        bin.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bin/show/$bin.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bin.clearErrors()

        populateValidParams(params)
        params.id = bin.id
        params.version = -1
        controller.update()

        assert view == "/bin/edit"
        assert model.binInstance != null
        assert model.binInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bin/list'

        response.reset()

        populateValidParams(params)
        def bin = new Bin(params)

        assert bin.save() != null
        assert Bin.count() == 1

        params.id = bin.id

        controller.delete()

        assert Bin.count() == 0
        assert Bin.get(bin.id) == null
        assert response.redirectedUrl == '/bin/list'
    }
}
