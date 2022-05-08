deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'rockpi-s-rk3308'
	name: 'ROCK Pi S'
	arch: 'aarch64'
	state: 'new'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/rockpi-s-rk3308/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/rockpi-s-rk3308/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/rockpi-s-rk3308/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'rockpi-s-rk3308'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'balena-image-flasher-rockpi-4b-rk3399.balenaos-img'
		compressed: true

	configuration:
		config:
			partition: 4
			path: '/config.json'

	initialization: commonImg.initialization
