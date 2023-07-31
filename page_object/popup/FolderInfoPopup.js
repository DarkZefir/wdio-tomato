const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class FolderInfoPopup extends Popup {

	selector = `.worklistInfo .popup`;

	NameInput = $(`.name input[type='text']`);
	NameLabel = $(`.name span`);
	DescriptionTextarea = $(`.desc textarea`);
	DescriptionLabel = $(`div.desc span`);
	CreationDateLabel = $(`label.date`);
	OwnerLabel = $(`.owner .text`);
	SharedUsers = $$(`.sharedUsers .user`);
	ManageMembersLink = $(`.sharedUsers span.popupLink`);
	TransferOwnershipLink = $(`.owner span.popupLink`);
	ManageTagsLink = $(`.tags span.popupLink`);
	Tags = $$(`.tags .tag`);
	SaveAndClose = $(`.save`);
	DeleteFolderButton = $(`.delete`);

}

module.exports = FolderInfoPopup;
