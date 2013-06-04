package com.mera.sqms

import org.springframework.dao.DataIntegrityViolationException

class ProjectNodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectNodeInstanceList: ProjectNode.list(params), projectNodeInstanceTotal: ProjectNode.count()]
    }

    def create() {
        [projectNodeInstance: new ProjectNode(params)]
    }

    def save() {
        def projectNodeInstance = new ProjectNode(params)
        if (!projectNodeInstance.save(flush: true)) {
            render(view: "create", model: [projectNodeInstance: projectNodeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), projectNodeInstance.id])
        redirect(action: "show", id: projectNodeInstance.id)
    }

    def show(Long id) {
        def projectNodeInstance = ProjectNode.get(id)
        if (!projectNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), id])
            redirect(action: "list")
            return
        }

        [projectNodeInstance: projectNodeInstance]
    }

    def edit(Long id) {
        def projectNodeInstance = ProjectNode.get(id)
        if (!projectNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), id])
            redirect(action: "list")
            return
        }

        [projectNodeInstance: projectNodeInstance]
    }

    def update(Long id, Long version) {
        def projectNodeInstance = ProjectNode.get(id)
        if (!projectNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectNodeInstance.version > version) {
                projectNodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectNode.label', default: 'ProjectNode')] as Object[],
                          "Another user has updated this ProjectNode while you were editing")
                render(view: "edit", model: [projectNodeInstance: projectNodeInstance])
                return
            }
        }

        projectNodeInstance.properties = params

        if (!projectNodeInstance.save(flush: true)) {
            render(view: "edit", model: [projectNodeInstance: projectNodeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), projectNodeInstance.id])
        redirect(action: "show", id: projectNodeInstance.id)
    }

    def delete(Long id) {
        def projectNodeInstance = ProjectNode.get(id)
        if (!projectNodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), id])
            redirect(action: "list")
            return
        }

        try {
            projectNodeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectNode.label', default: 'ProjectNode'), id])
            redirect(action: "show", id: id)
        }
    }
}
