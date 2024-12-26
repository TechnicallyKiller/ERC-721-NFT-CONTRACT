// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.10;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script{
    BasicNft deploybasic;

    function run() external returns(BasicNft){
        vm.startBroadcast();
        deploybasic= new BasicNft();
        vm.stopBroadcast();
        return deploybasic;


    }
}