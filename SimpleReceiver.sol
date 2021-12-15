/**
 *Submitted for verification at BscScan.com on 2021-08-31
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @dev Simple BNB receiver to ensure transfers with a static gas value succeed.
 */
contract SimpleReceiver is Ownable {
    receive() external payable {} 
    
    function withdraw() external onlyOwner {
       (bool success, /** bytes memory data */) = payable(owner()).call{value: address(this).balance}("");
       require(success, "receiver rejected ETH transfer");
    }
}