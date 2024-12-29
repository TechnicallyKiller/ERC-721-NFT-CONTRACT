// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.10;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";
contract MoodNft is ERC721 {
   error MoodNFT__CantFlipMoodIfNotOwner();
    string private s_happysvgIMGURI;
    string private s_sadsvgIMGURI;
    uint256 private s_tokencount;

constructor(string memory sadsvg, string memory happysvg) ERC721("MOOD", "MD"){
  s_happysvgIMGURI= happysvg;
  s_sadsvgIMGURI=sadsvg;
  s_tokencount=0;
}
enum MOOD {
    HAPPY,
    SAD
}

mapping(uint256=>MOOD) private s_tokenIdToMood;
function _baseURI() internal pure override returns(string memory){
    return "data:application/json;base64,";
}

function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
    address owner = ownerOf(tokenId); // Retrieve the token's owner
    return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
}


function mintNft() public {
    _safeMint(msg.sender, s_tokencount);
    s_tokenIdToMood[s_tokencount]=MOOD.HAPPY;
    s_tokencount++;
}
function tokenURI(uint256 tokenid) public view override returns (string memory){
    string memory ImgUri ;
    if(s_tokenIdToMood[tokenid]==MOOD.HAPPY){
        ImgUri=s_happysvgIMGURI;
    }
    else{
        ImgUri=s_sadsvgIMGURI;
    }
return string(
 bytes(   
abi.encodePacked(
    _baseURI(),
    Base64.encode(
  bytes(
    abi.encodePacked(
      '{"name: "',
      name(),
      '", description: "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": ',
        ImgUri,
      '"}'
    )
  )
)
)
 )
);



}
function flipMood(uint256 tokenId) public {
    if(!_isApprovedOrOwner(msg.sender, tokenId)){
        revert MoodNFT__CantFlipMoodIfNotOwner();
    }

    if(s_tokenIdToMood[tokenId] == MOOD.HAPPY){
        s_tokenIdToMood[tokenId] == MOOD.SAD;
    } else{
        s_tokenIdToMood[tokenId] == MOOD.HAPPY;
    }
}

}