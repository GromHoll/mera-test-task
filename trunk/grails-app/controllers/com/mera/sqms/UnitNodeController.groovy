package com.mera.sqms

import org.springframework.dao.DataIntegrityViolationException

class UnitNodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [unitNodeInstanceList: UnitNode.list(params), unitNodeInstanceTotal: UnitNode.count()]
    }

    def create() {
        [unitNodeInstance: new UnitNode(params)]
    }

    def save() {
        def unitNodeInstance = new UnitNode(params)
        if (!unitNodeInstance.save(flush: true)) {
            render(view: "create", model: [unitNodeInstance: unitNodeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), unitNodeInstance.id])
        redirect(action: "show", id: unitNodeInstance.id)
    }

    def show(Long id) {
        def unitNodeInstance = UnitNode.get(id)
        if (!unitNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), id])
            redirect(action: "list")
            return
        }

        [unitNodeInstance: unitNodeInstance]
    }

    def edit(Long id) {
        def unitNodeInstance = UnitNode.get(id)
        if (!unitNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), id])
            redirect(action: "list")
            return
        }

        [unitNodeInstance: unitNodeInstance]
    }

    def update(Long id, Long version) {
        def unitNodeInstance = UnitNode.get(id)
        if (!unitNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (unitNodeInstance.version > version) {
                unitNodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'unitNode.label', default: 'UnitNode')] as Object[],
                          "Another user has updated this UnitNode while you were editing")
                render(view: "edit", model: [unitNodeInstance: unitNodeInstance])
                return
            }
        }

        unitNodeInstance.properties = params

        if (!unitNodeInstance.save(flush: true)) {
            render(view: "edit", model: [unitNodeInstance: unitNodeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), unitNodeInstance.id])
        redirect(action: "show", id: unitNodeInstance.id)
    }

    def delete(Long id) {
        def unitNodeInstance = UnitNode.get(id)
        if (!unitNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), id])
            redirect(action: "list")
            return
        }

        try {
            unitNodeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'unitNode.label', default: 'UnitNode'), id])
            redirect(action: "show", id: id)
        }
    }
}
