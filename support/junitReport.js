const xml2js = require(`xml2js`);
const fs = require(`fs`);
/**
 * Juint Reporter
 * @type {JunitReport}
 */
class JunitReport {

	/**
     * Constructor of JunitReport
     * @param {Object} jsonData - cucumber json report
     */
	constructor(jsonData) {
		this.jsonData = jsonData;
	}

	/**
     * Build xml
     * @example
     * new JunitReport(jsonDate).build();
     */
	build() {
		return {
			testsuites: this.jsonData.map(testSuiteData => {
				return {
					testsuite: {
						$: this.getTestSuiteAttrs(testSuiteData),
						properties: this.getProperties(testSuiteData),
						testcase: this.getTestCases(testSuiteData)
					}
				};
			})
		};
	}

	/**
     * Get test cases data
     * @param {Array<Object>} testSuiteData
     * @return {Array<Object>}
     * @private
     */
	getTestCases(testSuiteData) {
		return testSuiteData.elements.map(testCase => {
			const tc = {
				$: {
					name: testCase.name,
					classname: testSuiteData.name,
					time: (testCase.steps.reduce((acc, step) => acc + (step.result.duration ? step.result.duration : 0), 0) / 1000000000).toString()
				}
			};
			const failedStep = testCase.steps.find(testStep => {
				return testStep.result.status === `failed`;
			});

			if (failedStep) {
				tc.failure = failedStep.result.error_message;
			}
			return tc;
		});
	}

	/**
     * Get properties data of test suite
     * @param {Object} testSuiteData
     * @return {Array<Object>}
     * @private
     */
	getProperties(testSuiteData) {
		return [
			{
				property: {
					$: {
						name: `URI`,
						value: testSuiteData.uri
					}
				}
			}
		];
	}

	/**
     * Get test suite attrs
     * @param {Object} testSuiteData
     * @return {{name, package, id}}
     * @private
     */
	getTestSuiteAttrs(testSuiteData) {
		return {
			name: testSuiteData.name,
			package: testSuiteData.name,
			id: testSuiteData.name
		};
	}
}

const builder = new xml2js.Builder();
const xml = builder.buildObject(new JunitReport(require(`../report/report.json`)).build());
fs.writeFileSync(`./report/report.xml`, xml);
