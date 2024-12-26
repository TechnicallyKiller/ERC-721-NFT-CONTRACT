// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.10;

import {Script} from "../lib/forge-std/src/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";


contract MintBasicNft is Script {
      string public constant TOKENURI =
      "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

  function run() external {
    address most_recently_deployed = DevOpsTools.get_most_recent_deployment("BasicNft",block.chainid);
    
    mintnftonContract(most_recently_deployed);

  }

  function mintnftonContract(address contract1) public {
    vm.startBroadcast();
    BasicNft(contract1).mintnft(TOKENURI);
    vm.stopBroadcast();


  }


}