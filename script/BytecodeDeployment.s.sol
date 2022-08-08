// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/BytecodeDeployer.sol";

contract BytecodeDeployment is Script {
    function setUp() public {}

    function run() public {
        address deployerAddress = vm.envAddress("DEPLOYER");
        bytes memory code = vm.envBytes("BYTECODE");
        vm.startBroadcast();

        BytecodeDeployer deployer = BytecodeDeployer(deployerAddress);
        address result = deployer.deploy(code);
        console.log("code deployed at", result);

        vm.stopBroadcast();
    }
}
