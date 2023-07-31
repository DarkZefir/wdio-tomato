const axios = require(`axios`);
const constants = require(`../../../memory`);

class JiraService {
	constructor() {
		this.client = axios.create({
			headers: {
				"Content-Type": `application/json`,
				Authorization: `Bearer ${constants.jiraAccessToken}`
			}
		});
	}

	async getNumberOfExecutionTestPages(id) {
		try {
			const response = await this.client.get(`https://jira.wolterskluwer.io/jira/rest/api/2/issue/${id}`);
			return Math.ceil(Number(response.data.fields.customfield_12303.length) / 200);
		} catch (err) {
			console.error(`Error fetching number of execution test pages from jira: ${err}`);
		}
	}

	async getNumberOfTestSetTestPages(id) {
		try {
			const response = await this.client.get(`https://jira.wolterskluwer.io/jira/rest/api/2/issue/${id}`);
			return Math.ceil(Number(response.data.fields.customfield_12301.length) / 200);
		} catch (err) {
			console.error(`Error fetching number of test set pages from jira: ${err}`);
		}
	}

	async getTestsFromExecutionPage(id, pageIndex = 1) {
		try {
			const response = await this.client.get(`https://jira.wolterskluwer.io/jira/rest/raven/1.0/api/testexec/${id}/test?limit=200&page=${pageIndex}`);
			return response.data;
		} catch (err) {
			console.error(`Error fetching ${id} test execution data from jira: ${err}`);
		}
	}

	async getTagsFromTestSetPage(id, pageIndex = 1) {
		try {
			const response = await this.client.get(`https://jira.wolterskluwer.io/jira/rest/raven/1.0/api/testset/${id}/test?limit=200&page=${pageIndex}`);
			return response.data;
		} catch (err) {
			console.error(`Error fetching ${id} test set data from jira: ${err}`);
		}
	}

	async uploadExecutionResults(id, executionResults) {
		try {
			const data = {
				testExecutionKey: id,
				tests: executionResults
			};
			await this.client.post(`https://jira.wolterskluwer.io/jira/rest/raven/1.0/import/execution`, data);
		} catch (err) {
			console.error(`Error while uploading execution results to jira: ${err}`);
		}
	}

	async updateTest({id, type, steps}) {
		try {
			const data = {
				fields: {
					customfield_12290: {
						id: `13891`
					},
					customfield_12291: type,
					customfield_12292: steps
				}
			};
			await this.client.put(`https://jira.wolterskluwer.io/jira/rest/api/2/issue/${id}`, data);
		} catch (err) {
			console.error(`Error while updating test ${id}: ${err}`);
		}
	}

	async updateTestSet(id, arrayOfTestsToAdd, arrayOfTestsToRemove) {
		try {
			const data = {
				add: arrayOfTestsToAdd,
				remove: arrayOfTestsToRemove,
			};
			await this.client.post(`https://jira.wolterskluwer.io/jira/rest/raven/1.0/api/testset/${id}/test`, data);
		} catch (err) {
			console.error(`Error while updating test set ${id}: ${err}`);
		}
	}

}

module.exports = new JiraService();
