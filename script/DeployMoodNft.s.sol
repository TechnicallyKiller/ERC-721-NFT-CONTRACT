// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Script} from "../lib/forge-std/src/Script.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";
import "../src/MoodNft.sol";

contract DeployMoodNft is Script {
    
    function run() external returns (MoodNft) {

    }

    function svgtoImgUri(string memory svg1) public pure returns (string memory imguri){
        string memory baseURl = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg1)))
        );
        return string(abi.encodePacked(baseURl,svgBase64Encoded));
    }
}