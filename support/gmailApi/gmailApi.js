const { google } = require(`googleapis`);
const email = require(`./communicationEmails.json`);

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 */
async function getOAuthClient() {
	let token = ``;
	if (process.env.ENV.includes(`VLCC`)) {
		token = email.VLCC.accessToken;
	} else {
		token = email.VL.accessToken;
	}
	const oAuth2Client = google.auth.fromJSON(token);
	return oAuth2Client;
}

/**
 * Get list of emails
 * @return {Promise}
 */
async function getEmailList() {
	const auth = await getOAuthClient();
	const gmail = google.gmail({version: `v1`, auth});
	return new Promise((resolve, reject) => {
		gmail.users.messages.list({userId: `me`}, (err, res) => {
			if (err) reject(new Error(`The API returned an error: ` + err));
			resolve(res.data.messages);
		});
	});
}

/**
 * delete all emails
 * @return {Promise}
 */
async function deleteAllEmails() {
	const auth = await getOAuthClient();
	const gmail = google.gmail({version: `v1`, auth});
	return new Promise((resolve, reject) => {
		gmail.users.messages.list({userId: `me`}, (err, res) => {
			if (err) reject(new Error(`The API returned an error: ` + err));
			if (res.data.messages) {
				gmail.users.messages.batchDelete({
					userId: `me`,
					resource: {
						ids: res.data.messages.map(message => message.id)
					}
				}, err => {
					if (err) reject(new Error(`The API returned an error: ` + err));
					resolve();
				});
			} else resolve();
		});
	});
}

/**
 * Get particular email
 * @return {Promise}
 */
async function getEmail(id) {
	const auth = await getOAuthClient();
	const gmail = google.gmail({version: `v1`, auth});
	return new Promise((resolve, reject) => {
		gmail.users.messages.get({
			userId: `me`,
			id: id
		}, (err, res) => {
			if (err) reject(new Error(`The API returned an error: ` + err));
			resolve(res.data.payload);
		});
	});
}

/**
 * Get content of particular email
 * @return {Promise}
 */
async function getEmailContent(email) {
	return Buffer.from(email.parts[0].parts[0].body.data, `base64`).toString();
}

/**
 * Get subject of particular email
 * @return {Promise}
 */
async function getEmailSubject(email) {
	return email.headers.find(header => header.name === `Subject`).value;
}

/**
 * Get sender of particular email
 * @return {Promise}
 */
async function getEmailSender(email) {
	return email.headers.find(header => header.name === `From`).value;
}

/**
 * Get receiver of particular email
 * @return {Promise}
 */
async function getEmailReceiver(email) {
	return email.headers.find(header => header.name === `To`).value;
}

/**
 * Get name of attached file for particular email
 * @return {Promise}
 */
async function getNameOfAttachedFile(email) {
	return email.parts[1].filename;
}

/**
 * Get format of attached file for particular email
 * @return {Promise}
 */
async function getFormatOfAttachedFile(email) {
	return email.parts[1].mimeType;
}

module.exports = {
	getEmailList,
	getEmail,
	deleteAllEmails,
	getEmailContent,
	getEmailSubject,
	getEmailSender,
	getEmailReceiver,
	getNameOfAttachedFile,
	getFormatOfAttachedFile
};