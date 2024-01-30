// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console2} from "forge-std/Script.sol";
import {CREATE3} from "solmate/src/utils/CREATE3.sol";
import {Counter} from "../src/Counter.sol";
import "forge-std/console.sol";
import {Base} from "./Base.s.sol";

contract DeployScript is Script, Base {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Counter counter = Counter(
            CREATE3.deploy(
                vm.envBytes32("DEPLOY_SALT"),
                type(Counter).creationCode,
                0
            )
        );
        counter.name();

        vm.stopBroadcast();
    }
}
