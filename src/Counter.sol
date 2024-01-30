// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function setNumberByAssembly(uint256 newNumber) public {
        assembly {
            sstore(0, newNumber)
        }
    }

    function increment() public {
        number++;
    }

    function name() public pure returns (string memory) {
        assembly {
            mstore(0x20, 0x20)
            mstore(0x47, 0x07436f756e746572)
            return(0x20, 0x60)
        }
    }
}
