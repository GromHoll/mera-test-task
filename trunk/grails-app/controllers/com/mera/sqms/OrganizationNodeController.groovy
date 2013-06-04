package com.mera.sqms

import org.springframework.dao.DataIntegrityViolationException

class OrganizationNodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [organizationNodeInstanceList: OrganizationNode.list(params), organizationNodeInstanceTotal: OrganizationNode.count()]
    }

    def create() {
        [organizationNodeInstance: new OrganizationNode(params)]
    }

    def save() {
        def organizationNodeInstance = new OrganizationNode(params)
        if (!organizationNodeInstance.save(flush: true)) {
            render(view: "create", model: [organizationNodeInstance: organizationNodeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), organizationNodeInstance.id])
        redirect(action: "show", id: organizationNodeInstance.id)
    }

    def show(Long id) {
        def organizationNodeInstance = OrganizationNode.get(id)
        if (!organizationNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), id])
            redirect(action: "list")
            return
        }

        [organizationNodeInstance: organizationNodeInstance]
    }

    def edit(Long id) {
        def organizationNodeInstance = OrganizationNode.get(id)
        if (!organizationNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), id])
            redirect(action: "list")
            return
        }

        [organizationNodeInstance: organizationNodeInstance]
    }

    def update(Long id, Long version) {
        def organizationNodeInstance = OrganizationNode.get(id)
        if (!organizationNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (organizationNodeInstance.version > version) {
                organizationNodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'organizationNode.label', default: 'OrganizationNode')] as Object[],
                          "Another user has updated this OrganizationNode while you were editing")
                render(view: "edit", model: [organizationNodeInstance: organizationNodeInstance])
                return
            }
        }

        organizationNodeInstance.properties = params

        if (!organizationNodeInstance.save(flush: true)) {
            render(view: "edit", model: [organizationNodeInstance: organizationNodeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), organizationNodeInstance.id])
        redirect(action: "show", id: organizationNodeInstance.id)
    }

    def delete(Long id) {
        def organizationNodeInstance = OrganizationNode.get(id)
        if (!organizationNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), id])
            redirect(action: "list")
            return
        }

        try {
            organizationNodeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organizationNode.label', default: 'OrganizationNode'), id])
            redirect(action: "show", id: id)
        }
    }
}
