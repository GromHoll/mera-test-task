package com.mera.sqms

import org.springframework.dao.DataIntegrityViolationException

class EmployeeNodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [employeeNodeInstanceList: EmployeeNode.list(params), employeeNodeInstanceTotal: EmployeeNode.count()]
    }

    def create() {
        [employeeNodeInstance: new EmployeeNode(params)]
    }

    def save() {
        def employeeNodeInstance = new EmployeeNode(params)
        if (!employeeNodeInstance.save(flush: true)) {
            render(view: "create", model: [employeeNodeInstance: employeeNodeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), employeeNodeInstance.id])
        redirect(action: "show", id: employeeNodeInstance.id)
    }

    def show(Long id) {
        def employeeNodeInstance = EmployeeNode.get(id)
        if (!employeeNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), id])
            redirect(action: "list")
            return
        }

        [employeeNodeInstance: employeeNodeInstance]
    }

    def edit(Long id) {
        def employeeNodeInstance = EmployeeNode.get(id)
        if (!employeeNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), id])
            redirect(action: "list")
            return
        }

        [employeeNodeInstance: employeeNodeInstance]
    }

    def update(Long id, Long version) {
        def employeeNodeInstance = EmployeeNode.get(id)
        if (!employeeNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (employeeNodeInstance.version > version) {
                employeeNodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employeeNode.label', default: 'EmployeeNode')] as Object[],
                          "Another user has updated this EmployeeNode while you were editing")
                render(view: "edit", model: [employeeNodeInstance: employeeNodeInstance])
                return
            }
        }

        employeeNodeInstance.properties = params

        if (!employeeNodeInstance.save(flush: true)) {
            render(view: "edit", model: [employeeNodeInstance: employeeNodeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), employeeNodeInstance.id])
        redirect(action: "show", id: employeeNodeInstance.id)
    }

    def delete(Long id) {
        def employeeNodeInstance = EmployeeNode.get(id)
        if (!employeeNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), id])
            redirect(action: "list")
            return
        }

        try {
            employeeNodeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employeeNode.label', default: 'EmployeeNode'), id])
            redirect(action: "show", id: id)
        }
    }
}
