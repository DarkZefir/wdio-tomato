module.exports = function (source, target) {
	({
		dragdrop: function (sourceElement, targetElement) {
			const CustomDataTransfer = function () {
				this.data = {};
			};

			CustomDataTransfer.prototype.dropEffect = `move`;
			CustomDataTransfer.prototype.effectAllowed = `all`;
			CustomDataTransfer.prototype.files = [];
			CustomDataTransfer.prototype.items = [];
			CustomDataTransfer.prototype.types = [];
			CustomDataTransfer.prototype.clearData = function (format) {
				if (format) {
					delete this.data[format];

					const index = this.types.indexOf(format);
					delete this.types[index];
					delete this.data[index];
				} else {
					this.data = {};
				}
			};
			CustomDataTransfer.prototype.setData = function (format, data) {
				this.data[format] = data;
				this.items.push(data);
				this.types.push(format);
			};
			CustomDataTransfer.prototype.getData = function (format) {
				if (format in this.data) {
					return this.data[format];
				}

				return ``;
			};
			CustomDataTransfer.prototype.setDragImage = function () {
			};

			const sourceCoordinates = sourceElement.getBoundingClientRect();
			const targetCoordinates = targetElement.getBoundingClientRect();
			const mouseDownEvent = this.createEvent(
				`mousedown`,
				{
					clientX: sourceCoordinates.left,
					clientY: sourceCoordinates.top
				}
			);
			sourceElement.dispatchEvent(mouseDownEvent);
			const dragStartEvent = this.createEvent(
				`dragstart`,
				{
					clientX: sourceCoordinates.left,
					clientY: sourceCoordinates.top,
					dataTransfer: new CustomDataTransfer()
				}
			);
			sourceElement.dispatchEvent(dragStartEvent);
			const dragEvent = this.createEvent(
				`drag`,
				{
					clientX: sourceCoordinates.left,
					clientY: sourceCoordinates.top
				}
			);
			sourceElement.dispatchEvent(dragEvent);
			const dragEnterEvent = this.createEvent(
				`dragenter`,
				{
					clientX: targetCoordinates.left,
					clientY: targetCoordinates.top,
					dataTransfer: dragStartEvent.dataTransfer
				}
			);
			targetElement.dispatchEvent(dragEnterEvent);
			const dragOverEvent = this.createEvent(
				`dragover`,
				{
					clientX: targetCoordinates.left,
					clientY: targetCoordinates.top,
					dataTransfer: dragStartEvent.dataTransfer
				}
			);
			targetElement.dispatchEvent(dragOverEvent);
			const dropEvent = this.createEvent(
				`drop`,
				{
					clientX: targetCoordinates.left,
					clientY: targetCoordinates.top,
					dataTransfer: dragStartEvent.dataTransfer
				}
			);
			targetElement.dispatchEvent(dropEvent);
			const dragEndEvent = this.createEvent(
				`dragend`,
				{
					clientX: targetCoordinates.left,
					clientY: targetCoordinates.top,
					dataTransfer: dragStartEvent.dataTransfer
				}
			);
			sourceElement.dispatchEvent(dragEndEvent);
			const mouseUpEvent = this.createEvent(
				`mouseup`,
				{
					clientX: targetCoordinates.left,
					clientY: targetCoordinates.top
				}
			);
			targetElement.dispatchEvent(mouseUpEvent);
		},

		createEvent: function (eventName, options) {
			const event = document.createEvent(`CustomEvent`);
			event.initCustomEvent(eventName, true, true, null);

			event.view = window;
			event.detail = 0;
			event.ctlrKey = false;
			event.altKey = false;
			event.shiftKey = false;
			event.metaKey = false;
			event.button = 0;
			event.relatedTarget = null;

			if (options.clientX && options.clientY) {
				event.screenX = window.screenX + options.clientX;
				event.screenY = window.screenY + options.clientY;
			}

			for (const prop in options) {
				event[prop] = options[prop];
			}

			return event;
		}
	}).dragdrop(source, target);
};
