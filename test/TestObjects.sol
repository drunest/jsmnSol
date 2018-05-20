pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "../contracts/JsmnSolLib.sol";

contract TestObjects {
    
    uint constant RETURN_SUCCESS = 0;
    uint constant RETURN_ERROR_INVALID_JSON = 1;
    uint constant RETURN_ERROR_PART = 2;
    uint constant RETURN_ERROR_NO_MEM = 3;
    
    function testSimpleObject() public {
        string memory json = '{"outerKey": {"innerKey": "value"}}';
        
        uint returnValue;
        JsmnSolLib.Token[] memory tokens;
        uint actualNum;
        
        (returnValue, tokens, actualNum) = JsmnSolLib.parse(json, 20);
        
        JsmnSolLib.Token memory t = tokens[4];
        
        Assert.equal(returnValue, RETURN_SUCCESS, 'Valid JSON should return a success.');
        Assert.isTrue(t.jsmnType == JsmnSolLib.JsmnType.STRING, 'Not an string');
        
        
    }
}
