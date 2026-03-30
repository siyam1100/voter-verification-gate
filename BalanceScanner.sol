// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BalanceScanner {
    /**
     * @dev Batch check balances to optimize bot API calls.
     */
    function batchCheck(address _token, address[] calldata _users) 
        external 
        view 
        returns (uint256[] memory balances) 
    {
        balances = new uint256[](_users.length);
        for (uint256 i = 0; i < _users.length; i++) {
            balances[i] = IERC20(_token).balanceOf(_users[i]);
        }
    }
}
