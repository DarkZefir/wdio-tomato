module.exports = {
	smoke: `@smoke and not (@histFavConfig or @ipa_only)`,
	criticalPath: `@critical_path and not @histFavConfig`,
	ipa: `@ipa or @ipa_only`,
	performance: `@performance`,
	histFavConfig: `@histFavConfig`,
	localSmoke: `@local`,
	localCritical: `@local`,
	smokeCI: `@smoke and not (@histFavConfig or @ipa_only or @local)`,
	criticalPathCI: `@critical_path and not (@local or @histFavConfig)`,
}[process.env.SUITE];
