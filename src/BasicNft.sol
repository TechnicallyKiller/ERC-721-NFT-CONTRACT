// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8.10;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";



contract BasicNft is ERC721{

    uint256 private s_privateTokenCounter;
    mapping (uint256 => string) IdtoTokenUri;

    constructor() ERC721("DOG","D"){
        s_privateTokenCounter=0;
    }
    
    function mintnft(string memory uri) public returns(uint256 tokenID) {
        IdtoTokenUri[s_privateTokenCounter]=uri;
        _safeMint(msg.sender,s_privateTokenCounter);
        s_privateTokenCounter++;

    }

    function tokenURI(uint256 tokenid) public view override returns (string memory){
          return IdtoTokenUri[tokenid];
    }

}