package dropoffbins

import org.springframework.dao.DataIntegrityViolationException

class BinController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def map() {
        def bins = Bin.list()
        [bins: bins, avgLat: avg(bins*.lat), avgLng: avg(bins*.lng)]
    }

    private avg(List<String> list) {
        list.collect {new BigDecimal(it)}.sum() / list.size()
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [binInstanceList: Bin.list(params), binInstanceTotal: Bin.count()]
    }

    def create() {
        [binInstance: new Bin(params)]
    }

    def save() {
        def binInstance = new Bin(params)
        if (!binInstance.save(flush: true)) {
            render(view: "create", model: [binInstance: binInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bin.label', default: 'Bin'), binInstance.id])
        redirect(action: "show", id: binInstance.id)
    }

    def show(Long id) {
        def binInstance = Bin.get(id)
        if (!binInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bin.label', default: 'Bin'), id])
            redirect(action: "list")
            return
        }

        [binInstance: binInstance]
    }

    def edit(Long id) {
        def binInstance = Bin.get(id)
        if (!binInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bin.label', default: 'Bin'), id])
            redirect(action: "list")
            return
        }

        [binInstance: binInstance]
    }

    def update(Long id, Long version) {
        def binInstance = Bin.get(id)
        if (!binInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bin.label', default: 'Bin'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (binInstance.version > version) {
                binInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bin.label', default: 'Bin')] as Object[],
                          "Another user has updated this Bin while you were editing")
                render(view: "edit", model: [binInstance: binInstance])
                return
            }
        }

        binInstance.properties = params

        if (!binInstance.save(flush: true)) {
            render(view: "edit", model: [binInstance: binInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bin.label', default: 'Bin'), binInstance.id])
        redirect(action: "show", id: binInstance.id)
    }

    def delete(Long id) {
        def binInstance = Bin.get(id)
        if (!binInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bin.label', default: 'Bin'), id])
            redirect(action: "list")
            return
        }

        try {
            binInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bin.label', default: 'Bin'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bin.label', default: 'Bin'), id])
            redirect(action: "show", id: id)
        }
    }
}
