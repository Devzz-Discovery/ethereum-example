// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


library StringLib {

    // функция для сравнения строк
    function equals(string memory str, string memory other) public pure returns(bool) {
        return keccak256(abi.encode(str)) == keccak256(abi.encode(other));
    }

}

