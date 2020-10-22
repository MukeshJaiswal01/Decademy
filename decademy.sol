pragma solidity 0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract decademy is ERC721("decademy", "DEC"){
    
    uint private _tokenIds;
    string [] public URl;
    mapping(uint => string) public id_to_url;
    mapping(string => bool) url_exist;
    
    function awardItem( string memory _tokenURI) internal {
        
        require(url_exist[_tokenURI] != true, " url already exist");
        _tokenIds++;

        uint256 newItemId = _tokenIds;
        id_to_url[newItemId] = _tokenURI;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
         url_exist[_tokenURI] = true;


    }
    
    function buyItem(string memory _tokenURI) public payable{
         
         awardItem(_tokenURI);
    }
    

        
    
}
