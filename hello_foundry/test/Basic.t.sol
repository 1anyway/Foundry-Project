//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract ContractBTest is Test {
    uint256 testNumber;

    function setUp() public {
        testNumber = 42;
    }

    function testNumberIs42() public {
        assertEq(testNumber, 42);
    }

    function testFailSubtract43() public {
        testNumber -= 43;
    }
    
    function testCannotSubtract43() public {
        vm.expectRevert(stdError.arithmeticError);
        testNumber -= 43;
    }
}

// Shared setups

// abstract contract HelperContract {
//     address constant IMPORTANT_ADDRESS = 0x543d;
//     SomeContract someContract;
//     constructor() { }

// }

// contract MyOtherContractTest is Test, HelperContract {
//     function setUp() public {
//         someContract = new SomeContract(0, IMPORTANT_ADDRESS);
//     }
// }

// contract MyOtherContractTest is Test, HelperContract {
//     function setUp() public {
//         someContract = new SomeContract(1000, IMPORTANT_ADDRESS);
//     }
// }

