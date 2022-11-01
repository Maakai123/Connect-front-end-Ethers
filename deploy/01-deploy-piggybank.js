
const { network } = require("hardhat")
const {networkConfig,developmentChains} = require("../helper-hardhat-config")
const { verify } = require("../utils/verify")

module.exports = async ({getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId

    

    log("---------------------------")

    arguments =[]

    log("Deploying piggy and waiting for confirmations")
    const piggybank = await deploy("PiggyBank", {
        from: deployer,
        args: arguments,
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,

    })

     log(`Piggybank deployed at ${piggybank.address}`)


 //Verify the deployment
 if(!developmentChains.includes(network.name)&& process.env.ETHERSCAN_API_KEY) {
    log("verifying........")
    await verify(piggybank.address, arguments)
 }
    
log("--------------------")

}

module.exports.tags = ["all","piggybank"]