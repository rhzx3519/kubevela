// inputs
template: {
	parameter: {
		port: [1023]
		annotations: "test": "value"
	}
}

context: {
	name: "mysvc"
}

// expected outputs
outputs: {
	service: {
		apiVersion: "v1"
		kind:       "Service"
		metadata: name: "mysvc"
		metadata: annotations: "test": "value"
		spec: {
			selector: "app.oam.dev/component": context.name
			ports: [
				{
					name:       "port-1023"
					port:       1023
					targetPort: 1023
				},
			]
			type: "ClusterIP"
		}
	}
}