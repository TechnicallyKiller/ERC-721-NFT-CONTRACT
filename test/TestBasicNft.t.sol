// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.10;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract TestBasicNft is Test{
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    function setUp() public {
        deployer= new DeployBasicNft();
        basicNft = new BasicNft();

    }

    function testNameisCorrect() public view {
  string memory expectedName = "DOG";
  string memory actualName = basicNft.name();

  assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
}

  
  string public constant TOKENURI =
      "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";





}
