const stakingGame = artifacts.require("stakingGame");

module.exports = function (deployer) {
  deployer.deploy(stakingGame);
};