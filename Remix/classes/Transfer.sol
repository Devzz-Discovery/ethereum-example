// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./Balance.sol";

contract Transfer is Ownable, Balance {

    // в конструкторе указываем owner, которому доступна операция вывода средств с баланса контракта.
    constructor(address _owner) {
        owner = _owner;
    }

    // любой может отправить средства, но вывести может только owner 
    function pay() public payable {} 

}

